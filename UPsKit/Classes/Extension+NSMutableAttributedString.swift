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
    color: UIColor? = nil,
    lineSpace: CGFloat? = nil,
    lineOffset: CGFloat? = nil
  ) -> NSMutableAttributedString {
    let attributedString = NSMutableAttributedString(string: text)
    
    if let font = font {
      attributedString.addAttribute(
        NSAttributedString.Key.font,
        value: font,
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
    
    if let lineSpace = lineSpace {
      let style = NSMutableParagraphStyle()
      style.lineSpacing = lineSpace
      attributedString.addAttribute(.paragraphStyle,
                                   value: style,
                                   range: NSRange(location: 0, length: attributedString.length))
    }
    
    if let lineOffset = lineOffset {
      attributedString.addAttribute(
        NSAttributedString.Key.baselineOffset,
        value: lineOffset,
        range: (text as NSString).range(of: keyword)
      )
    }
    
    return attributedString
  }
  
  
  
  class func config(
    text: String,
    keywords: [String],
    font: UIFont? = nil,
    color: UIColor? = nil,
    lineSpace: CGFloat? = nil,
    lineOffset: CGFloat? = nil
  ) -> NSMutableAttributedString {
    let attributedString = NSMutableAttributedString(string: text)
    
    for keyword in keywords {
      if let font = font {
        attributedString.addAttribute(
          NSAttributedString.Key.font,
          value: font,
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
      
      if let lineSpace = lineSpace {
        let style = NSMutableParagraphStyle()
        style.lineSpacing = lineSpace
        attributedString.addAttribute(.paragraphStyle,
                                     value: style,
                                     range: NSRange(location: 0, length: attributedString.length))
      }
      
      if let lineOffset = lineOffset {
        attributedString.addAttribute(
          NSAttributedString.Key.baselineOffset,
          value: lineOffset,
          range: (text as NSString).range(of: keyword)
        )
      }
    }
    
    return attributedString
  }
}
