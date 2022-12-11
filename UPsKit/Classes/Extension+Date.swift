//
//  Extension+Date.swift
//  UPsKit
//
//  Created by Lee on 2022/06/13.
//

import Foundation

public extension Date {
  
  func toString(_ formatter: UPsFormatter.Date) -> String {
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = formatter.rawValue
    dateFormatter.locale = Locale(identifier: "ko_KR")
    return dateFormatter.string(from: self as Date)
  }
  
  func toString(_ formatter: String) -> String {
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = formatter
    dateFormatter.locale = Locale(identifier: "ko_KR")
    return dateFormatter.string(from: self as Date)
  }
  
  
  
  func yearInt() -> Int {
    var calendar = Calendar(identifier: .gregorian)
    calendar.locale = Locale(identifier: "ko_KR")
    let components = calendar.dateComponents([.year], from: self)
    return components.year!
  }
  
  func monthInt() -> Int {
    var calendar = Calendar(identifier: .gregorian)
    calendar.locale = Locale(identifier: "ko_KR")
    let components = calendar.dateComponents([.month], from: self)
    return components.month!
  }
  
  func weekdayInt() -> Int {
    var calendar = Calendar(identifier: .gregorian)
    calendar.locale = Locale(identifier: "ko_KR")
    let components = calendar.dateComponents([.weekday], from: self)
    return components.weekday!
  }
  
  func weekdayOrdinalInt() -> Int {
    var calendar = Calendar(identifier: .gregorian)
    calendar.locale = Locale(identifier: "ko_KR")
    let components = calendar.dateComponents([.weekdayOrdinal], from: self)
    return components.weekdayOrdinal!
  }
  
  func dayInt() -> Int {
    var calendar = Calendar(identifier: .gregorian)
    calendar.locale = Locale(identifier: "ko_KR")
    let components = calendar.dateComponents([.day], from: self)
    return components.day!
  }
  
  func hourInt() -> Int {
    var calendar = Calendar(identifier: .gregorian)
    calendar.locale = Locale(identifier: "ko_KR")
    let components = calendar.dateComponents([.hour], from: self)
    return components.hour!
  }
  
  func minuteInt() -> Int {
    var calendar = Calendar(identifier: .gregorian)
    calendar.locale = Locale(identifier: "ko_KR")
    let components = calendar.dateComponents([.minute], from: self)
    return components.minute!
  }
  
  func secondInt() -> Int {
    var calendar = Calendar(identifier: .gregorian)
    calendar.locale = Locale(identifier: "ko_KR")
    let components = calendar.dateComponents([.second], from: self)
    return components.second!
  }
  
  func nanosecondInt() -> Int {
    var calendar = Calendar(identifier: .gregorian)
    calendar.locale = Locale(identifier: "ko_KR")
    let components = calendar.dateComponents([.nanosecond], from: self)
    return components.nanosecond!
  }
}
