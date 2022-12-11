//
//  Extension+UITextField.swift
//  UPsKit
//
//  Created by Lee on 2022/05/26.
//

import UIKit

public extension UITextField {
  
  func setPadding(_ amount: CGFloat = 16) {
    let leftPaddingView = UIView(frame: CGRect(x: 0, y: 0, width: amount, height: self.frame.size.height))
    self.leftView = leftPaddingView
    self.leftViewMode = .always
    
    let rightPaddingView = UIView(frame: CGRect(x: 0, y: 0, width: amount, height: self.frame.size.height))
    self.rightView = rightPaddingView
    self.rightViewMode = .always
  }
  
  func setLeftPadding(_ amount: CGFloat = 16) {
    let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: amount, height: self.frame.size.height))
    self.leftView = paddingView
    self.leftViewMode = .always
  }
  
  func setRightPadding(_ amount: CGFloat = 16) {
    let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: amount, height: self.frame.size.height))
    self.rightView = paddingView
    self.rightViewMode = .always
  }
}
