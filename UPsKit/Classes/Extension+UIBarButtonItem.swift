//
//  Extension+UIBarButtonItem.swift
//  UPsKit
//
//  Created by YouUp Lee on 2022/06/26.
//

import UIKit

extension UIBarButtonItem {
  
  public convenience init(title: String, style: UIBarButtonItem.Style = .plain) {
    self.init(title: title, style: style, target: nil, action: nil)
  }
}
