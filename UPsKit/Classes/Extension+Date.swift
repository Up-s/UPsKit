//
//  Extension+Date.swift
//  UPsKit
//
//  Created by Lee on 2022/06/13.
//

import Foundation

extension Date {
  
  public enum Formatter: String {
    case yyyyMMdd = "yyyy-MM-dd"
  }
  
  public func toString(_ formatter: Formatter) -> String {
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = formatter.rawValue
    return dateFormatter.string(from: self as Date)
  }
  
  
  public func add(hour: Int, min: Int, sec: Int) -> Date {
    let hourDate = Calendar.current.date(byAdding: .hour, value: hour, to: Date())
    let minDate = Calendar.current.date(byAdding: .minute, value: min, to: hourDate!)
    return Calendar.current.date(byAdding: .second, value: sec, to: minDate!)!
  }
}
