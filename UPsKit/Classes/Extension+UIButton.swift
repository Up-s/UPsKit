//
//  Extension+UIButton.swift
//  UPsKit
//
//  Created by UPs on 2022/12/17.
//

import UIKit

public extension UIButton {
  
  func setIcon(_ icon: UIImage?, _ color: UIColor) {
    let editIcon = icon?.withTintColor(color, renderingMode: .alwaysOriginal)
    self.setImage(editIcon, for: .normal)
  }
}
