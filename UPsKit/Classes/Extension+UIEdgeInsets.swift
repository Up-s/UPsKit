//
//  Extension+UIEdgeInsets.swift
//  UPsKit
//
//  Created by Lee on 2022/05/26.
//

import UIKit

public extension UIEdgeInsets {
  
  init(all: CGFloat) {
    self.init(top: all, left: all, bottom: all, right: all)
  }
  
  init(x: CGFloat, y: CGFloat) {
    self.init(top: y, left: x, bottom: y, right: x)
  }
  
  init(top: CGFloat) {
    self.init(top: top, left: .zero, bottom: .zero, right: .zero)
  }
  
  init(left: CGFloat) {
    self.init(top: .zero, left: left, bottom: .zero, right: .zero)
  }
  
  init(bottom: CGFloat) {
    self.init(top: .zero, left: .zero, bottom: bottom, right: .zero)
  }
  
  init(right: CGFloat) {
    self.init(top: .zero, left: .zero, bottom: .zero, right: right)
  }
}
