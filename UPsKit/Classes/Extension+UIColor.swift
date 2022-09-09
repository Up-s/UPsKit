//
//  Extension+UIColor.swift
//  UPsKit
//
//  Created by Lee on 2022/05/26.
//

import UIKit

extension UIColor {
  
  public convenience init?(hex: String) {
    let r, g, b, a: CGFloat
    
    if hex.hasPrefix("#") {
      let start = hex.index(hex.startIndex, offsetBy: 1)
      let hexColor = String(hex[start...])
      
      if hexColor.count == 8 {
        let scanner = Scanner(string: hexColor)
        var hexNumber: UInt64 = 0
        
        if scanner.scanHexInt64(&hexNumber) {
          r = CGFloat((hexNumber & 0xff000000) >> 24) / 255
          g = CGFloat((hexNumber & 0x00ff0000) >> 16) / 255
          b = CGFloat((hexNumber & 0x0000ff00) >> 8) / 255
          a = CGFloat(hexNumber & 0x000000ff) / 255
          
          self.init(red: r, green: g, blue: b, alpha: a)
          return
        }
      }
    }
    
    return nil
  }
  
  public class var random: UIColor {
    let min: CGFloat = 0.2
    let max: CGFloat = 0.9
    
    let red = CGFloat.random(in: min ... max)
    let green = CGFloat.random(in: min ... max)
    let blue = CGFloat.random(in: min ... max)
    
    return UIColor(red: red, green: green, blue: blue, alpha: 1.0)
  }
  
}
