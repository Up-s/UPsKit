//
//  Extension+UIColor.swift
//  UPsKit
//
//  Created by Lee on 2022/05/26.
//

import UIKit

public extension UIColor {
  
  convenience init?(hex: String) {
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
  
  class var random: UIColor {
    let min: CGFloat = 0.2
    let max: CGFloat = 0.9
    
    let red = CGFloat.random(in: min ... max)
    let green = CGFloat.random(in: min ... max)
    let blue = CGFloat.random(in: min ... max)
    
    return UIColor(red: red, green: green, blue: blue, alpha: 1.0)
  }
  
  convenience init(_ hex: String, alpha: Int = 100) {
      var cString = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
      
      if cString.hasPrefix("#") { cString.removeFirst() }
      
      if cString.count != 6 {
          self.init("ff0000") // return red color for wrong hex input
          return
      }
      
      var rgbValue: UInt64 = 0
      Scanner(string: cString).scanHexInt64(&rgbValue)
      
      self.init(red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
                green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
                blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
                alpha: CGFloat(alpha) / 100)
  }
  
  convenience init(light: UIColor, dark: UIColor) {
      self.init { (traits) -> UIColor in
          switch traits.userInterfaceStyle {
          case .dark:
              return dark
          default:
              return light
          }
      }
  }
  
  convenience init(light: String, dark: String) {
      let lightColor = UIColor(light)
      let darkColor = UIColor(dark)
      
      self.init { (traits) -> UIColor in
          switch traits.userInterfaceStyle {
          case .dark:
              return darkColor
          default:
              return lightColor
          }
      }
  }
}
