//
//  Extension+NSMutableAttributedString.swift
//  UPsKit
//
//  Created by Lee on 2022/05/26.
//

import UIKit

public extension NSMutableAttributedString {
  
  class func make(text: String, keyword: String, keywordFont: UIFont, keywordColor: UIColor = .red) -> NSMutableAttributedString {
    let attributedString = NSMutableAttributedString(string: text)
    attributedString.addAttribute(NSAttributedString.Key.font, value: keywordFont, range: (text as NSString).range(of: keyword))
    attributedString.addAttribute(NSAttributedString.Key.foregroundColor, value: keywordColor, range: (text as NSString).range(of: keyword))
    return attributedString
  }
}
