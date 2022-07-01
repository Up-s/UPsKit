//
//  Extension+Date.swift
//  UPsKit
//
//  Created by Lee on 2022/06/13.
//

import Foundation

extension Date {
  
  public enum Formatter: String {
    
    case HHmmss = "HH:mm:ss"
    case MdEEEEEHHmmss = "M월 d일 (EEEEE) HH:mm:ss"
    case yyyyMMdd = "yyyy-MM-dd"
  }
  
  public func toString(_ formatter: Formatter) -> String {
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = formatter.rawValue
    dateFormatter.locale = Locale(identifier: "ko_KR")
    return dateFormatter.string(from: self as Date)
  }
}
