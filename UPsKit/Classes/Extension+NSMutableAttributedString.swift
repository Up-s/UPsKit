//
//  Extension+NSMutableAttributedString.swift
//  UPsKit
//
//  Created by Lee on 2022/05/26.
//

import UIKit

public extension NSMutableAttributedString {
  
  class func config(
      text: String,
      keyword: String,
      font: UIFont? = nil,
      lineOffset: CGFloat? = nil,
      color: UIColor? = nil
  ) -> NSMutableAttributedString {
      let attributedString = NSMutableAttributedString(string: text)
      
      if let font = font {
          attributedString.addAttribute(
              NSAttributedString.Key.font,
              value: font,
              range: (text as NSString).range(of: keyword)
          )
      }
      
      if let lineOffset = lineOffset {
          attributedString.addAttribute(
              NSAttributedString.Key.baselineOffset,
              value: lineOffset,
              range: (text as NSString).range(of: keyword)
          )
      }
      
      if let color = color {
          attributedString.addAttribute(
              NSAttributedString.Key.foregroundColor,
              value: color,
              range: (text as NSString).range(of: keyword)
          )
      }
      
      return attributedString
  }
}
