//
//  Extensoin+UIImage.swift
//  UPsKit
//
//  Created by Lee on 2022/05/26.
//

import UIKit

public extension UIImage {
  
  class func sf(name: String, color: UIColor? = nil) -> UIImage? {
    let tempImage = UIImage(systemName: name)
    let tempColor = color ?? UIColor.systemRed
    let tempColorImage = tempImage?.withTintColor(tempColor, renderingMode: .alwaysOriginal)
    return tempColorImage
  }
  
  class func sfConfiguration(name: String, color: UIColor = .gray900, pointSize: CGFloat = 20, weight: SymbolWeight = .medium, scale: SymbolScale = .default) -> UIImage? {
    let configuration = UIImage.SymbolConfiguration(pointSize: pointSize, weight: weight, scale: scale)
    let tempImage = UIImage(systemName: name, withConfiguration: configuration)
    let tempColor = color
    let tempColorImage = tempImage?.withTintColor(tempColor, renderingMode: .alwaysOriginal)
    return tempColorImage
  }
}
