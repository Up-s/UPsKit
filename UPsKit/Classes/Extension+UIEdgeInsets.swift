//
//  Extension+UIEdgeInsets.swift
//  UPsKit
//
//  Created by Lee on 2022/05/26.
//

import UIKit

extension UIEdgeInsets {
  
  public init(all: CGFloat) {
    self.init(top: all, left: all, bottom: all, right: all)
  }
  
  public init(x: CGFloat, y: CGFloat) {
    self.init(top: y, left: x, bottom: y, right: x)
  }
}
