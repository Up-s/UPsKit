//
//  BaseView.swift
//  UPsKit
//
//  Created by UPs on 2022/09/10.
//

import UIKit

open class BaseView: UIView {
  
  public var targetViewConstraint: NSLayoutConstraint?
  public var targetViewConstant: CGFloat?
  
  
  
  public init() {
    super.init(frame: .zero)
  }
  
  public required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  deinit {
      print("🎉🎉🎉 deinit: \(self.className) 🎉🎉🎉")
  }
}



extension BaseView {
  
  public func addKeyboardNoti() {
    NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardNotiAction(_:)), name: UIResponder.keyboardWillShowNotification, object: nil)
    NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardNotiAction(_:)), name: UIResponder.keyboardWillHideNotification, object: nil)
  }
  
  @objc private func keyboardNotiAction(_ notification: Notification) {
    guard
      let duration = notification.userInfo![UIResponder.keyboardAnimationDurationUserInfoKey] as? Double,
      let curve = notification.userInfo![UIResponder.keyboardAnimationCurveUserInfoKey] as? UInt,
      let keyboardFrame = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue
    else { return }
    
    let height: CGFloat
    switch notification.name {
    case UIResponder.keyboardWillShowNotification:
      height = -keyboardFrame.cgRectValue.height + self.safeAreaInsets.bottom + (self.targetViewConstant ?? 0)
      
    case UIResponder.keyboardWillHideNotification:
      height = self.targetViewConstant ?? 0
      
    default:
      return
    }
    
    UIView.animate(withDuration: duration, delay: 0, options: UIView.AnimationOptions(rawValue: curve), animations: { [weak self] in
      guard let self = self else { return }
      self.targetViewConstraint?.constant = height
      self.layoutIfNeeded()
    })
  }
}
