//
//  UPsColor.swift
//  UPsKit
//
//  Created by YouUp Lee on 2022/12/11.
//

import UIKit

public extension UIColor {
  
  // MARK: - Base
  
  static var light: UIColor { UIColor(light: .white, dark: .black) }
  static var dark: UIColor { UIColor(light: .black, dark: .white) }
  static var error: UIColor { UIColor("E30000") }
  
  
  
  // MARK: - Gray
  
  static var gray100: UIColor {
    let light = UIColor("F9FAFC")
    let dark = UIColor("17181A")
    return UIColor(light: light, dark: dark)
  }
  
  static var gray200: UIColor {
    let light = UIColor("F0F2F5")
    let dark = UIColor("262629")
    return UIColor(light: light, dark: dark)
  }
  
  static var gray300: UIColor {
    let light = UIColor("D9DCE0")
    let dark = UIColor("37383B")
    return UIColor(light: light, dark: dark)
  }
  
  static var gray400: UIColor {
    let light = UIColor("BCBFC4")
    let dark = UIColor("56585C")
    return UIColor(light: light, dark: dark)
  }
  
  static var gray500: UIColor {
    let light = UIColor("A0A2A8")
    let dark = UIColor("74767A")
    return UIColor(light: light, dark: dark)
  }
  
  static var gray600: UIColor {
    let light = UIColor("7D7F85")
    let dark = UIColor("A2A4A8")
    return UIColor(light: light, dark: dark)
  }
  
  static var gray700: UIColor {
    let light = UIColor("57595E")
    let dark = UIColor("C6C8CC")
    return UIColor(light: light, dark: dark)
  }
  
  static var gray800: UIColor {
    let light = UIColor("3F4045")
    let dark = UIColor("DCDEE0")
    return UIColor(light: light, dark: dark)
  }
  
  static var gray900: UIColor {
    let light = UIColor("252629")
    let dark = UIColor("EDEEF0")
    return UIColor(light: light, dark: dark)
  }
}
