//
//  Extension+UIColor.swift
//  UPsKit
//
//  Created by Lee on 2022/05/26.
//

import UIKit

extension UIColor {
  
  public class var random: UIColor {
    let min: CGFloat = 0.2
    let max: CGFloat = 0.9
    
    let red = CGFloat.random(in: min ... max)
    let green = CGFloat.random(in: min ... max)
    let blue = CGFloat.random(in: min ... max)
    
    return UIColor(red: red, green: green, blue: blue, alpha: 1.0)
  }
  
}
