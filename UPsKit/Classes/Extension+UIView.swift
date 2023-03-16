//
//  Extension+UIView.swift
//  UPsKit
//
//  Created by Lee on 2022/05/26.
//

import UIKit

public extension UIView {
  
  var parentViewController: UIViewController? {
    var responder: UIResponder? = self
    while let nextResponder = responder?.next {
      responder = nextResponder
      if let vc = nextResponder as? UIViewController {
        return vc
      }
    }
    return nil
  }
  
  func shadow() {
    let shadowPath = UIBezierPath(rect: self.bounds)
    self.layer.shadowPath = shadowPath.cgPath
    self.layer.shadowRadius = 5.0
    self.layer.shadowOpacity = 0.3
    self.layer.shadowOffset = .zero
    self.layer.shadowColor = UIColor.darkGray.cgColor
  }
  
  func setCornerRadius(_ value: CGFloat) {
    self.layer.cornerRadius = value
    self.layer.masksToBounds = true
  }
}
