//
//  UPsAlertBaseView.swift
//  UPsKit
//
//  Created by YouUp Lee on 2023/07/30.
//

import UIKit

import SnapKit

public class UPsAlertBaseView: UIView {
  
  // MARK: - Property
  
  private var visualEffectView: UIVisualEffectView?
  private let alertView: UPsAlertView
  
  private var topConstraint: NSLayoutConstraint?
  private var beganPointY: CGFloat?
  private var beganTopConstant: CGFloat?
  
  
  
  // MARK: - Life Cycle
  
  public init(_ contents: UPsAlertContentsProtocol) {
    self.alertView = UPsAlertView(contents)
    super.init(frame: .zero)
    
    self.setAttribute()
    self.setConstraint()
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  private var isLayoutSubviews = true
  public override func layoutSubviews() {
    super.layoutSubviews()
    
    if self.isLayoutSubviews {
      self.isLayoutSubviews = false
      self.setBlurView()
      self.setAlertView()
    }
  }
  
  
  
  // MARK: - Touch
  
  public override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
    super.touchesBegan(touches, with: event)
    
    guard let touch = touches.first else { return }
    let point = touch.location(in: self.superview)
    
    switch self.alertView.frame.contains(point) {
    case true:
      self.beganPointY = point.y
      self.beganTopConstant = self.topConstraint?.constant
      
    case false:
      self.closeAlert()
    }
  }
  
  public override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
    super.touchesMoved(touches, with: event)
    
    guard let touch = touches.first else { return }
    let point = touch.location(in: self.superview)
    guard self.alertView.frame.contains(point) else { return }
    
    let moveConstant = point.y - (self.beganPointY ?? 0.0) + (self.beganTopConstant ?? 0.0)
    let maxPointY = -self.alertViewHeight
    
    switch moveConstant {
    case maxPointY...0.0:
      self.visualEffectView?.alpha = moveConstant / maxPointY
      self.topConstraint?.constant = moveConstant

    case 0.0...:
      self.visualEffectView?.alpha = 0.0
      self.topConstraint?.constant = 0.0
      
    case ...maxPointY:
      self.visualEffectView?.alpha = 1.0
      self.topConstraint?.constant = maxPointY
      
    default:
      break
    }
  }
  
  public override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
    super.touchesEnded(touches, with: event)
    
    self.updatePosition()
  }
  
  public override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
    super.touchesCancelled(touches, with: event)
    
    self.updatePosition()
  }
  
  private func updatePosition() {
    let endConstant = self.topConstraint?.constant ?? 0.0
    let targetPointY = -self.alertViewHeight * 0.7
    
    let isDismiss: Bool
    switch endConstant {
    case targetPointY...:
      isDismiss = true
      
    case ...targetPointY:
      isDismiss = false
      
    default:
      return
    }
    
    UIView.animate(
      withDuration: 0.2,
      delay: 0.0,
      options: .curveEaseInOut,
      animations: { [weak self] in
        guard let self = self else { return }
        self.visualEffectView?.alpha = isDismiss ? 0.0 : 1.0
        self.topConstraint?.constant = isDismiss ? 0.0 : -self.alertViewHeight
        self.superview?.layoutIfNeeded()
      },
      completion: { [weak self] _ in
        guard isDismiss else { return }
        self?.removeFromSuperview()
      }
    )
  }
  
  private var alertViewHeight: CGFloat {
    self.alertView.bounds.height
  }
  
  
  
  // MARK: - Interface
  
  private func setBlurView() {
    let blurEffect = UIBlurEffect(style: .regular)
    let visualEffectView = UIVisualEffectView(effect: blurEffect)
    visualEffectView.alpha = 0.0
    visualEffectView.frame = self.frame
    self.addSubview(visualEffectView)
    self.visualEffectView = visualEffectView
    
    UIView.animate(
      withDuration: 0.2,
      delay: .zero,
      options: .curveEaseInOut,
      animations: { [weak self] in
        visualEffectView.alpha = 1.0
        self?.layoutIfNeeded()
      }
    )
  }
  
  private func setAlertView() {
    self.addSubview(self.alertView)
    self.alertView.snp.makeConstraints { make in
      make.leading.trailing.equalToSuperview()
    }
    self.topConstraint = self.alertView.topAnchor.constraint(equalTo: self.bottomAnchor)
    self.topConstraint?.isActive = true
    
    DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
      UIView.animate(
        withDuration: 0.2,
        delay: .zero,
        options: .curveEaseInOut,
        animations: { [weak self] in
          guard let self else { return }
          self.topConstraint?.constant = -self.alertViewHeight
          self.layoutIfNeeded()
        }
      )
    }
  }
  
  private func closeAlert() {
    UIView.animate(
      withDuration: 0.2,
      delay: .zero,
      options: .curveEaseInOut,
      animations: { [weak self] in
        guard let self else { return }
        self.visualEffectView?.alpha = 0.0
        self.topConstraint?.constant = self.alertViewHeight
        self.layoutIfNeeded()
      },
      completion: { [weak self] _ in
        self?.removeFromSuperview()
      }
    )
  }
  
  @objc private func closeDidTap(_ sender: UIButton) {
    self.closeAlert()
  }
  
  
  
  // MARK: - UI
  
  private func setAttribute() {
    var buttons = self.alertView.actionButtons
    buttons.append(self.alertView.closeButton)
    buttons.forEach {
      $0.addTarget(self, action: #selector(self.closeDidTap(_:)), for: .touchUpInside)
    }
  }
  
  private func setConstraint() {
    
  }
}
