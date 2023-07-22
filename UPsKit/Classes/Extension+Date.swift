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
    dateFormatter.locale = Locale(identifier: Locale.current.identifier)
    dateFormatter.timeZone = TimeZone(identifier: TimeZone.current.identifier)
    return dateFormatter.string(from: self as Date)
  }
  
  func toString(_ formatter: String) -> String {
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = formatter
    dateFormatter.locale = Locale(identifier: Locale.current.identifier)
    dateFormatter.timeZone = TimeZone(identifier: TimeZone.current.identifier)
    return dateFormatter.string(from: self as Date)
  }
  
  
  
  var yearInt: Int {
    var calendar = Calendar(identifier: .gregorian)
    calendar.locale = Locale(identifier: Locale.current.identifier)
    let components = calendar.dateComponents([.year], from: self)
    return components.year!
  }
  
  var monthInt: Int {
    var calendar = Calendar(identifier: .gregorian)
    calendar.locale = Locale(identifier: Locale.current.identifier)
    let components = calendar.dateComponents([.month], from: self)
    return components.month!
  }
  
  var weekdayInt: Int {
    var calendar = Calendar(identifier: .gregorian)
    calendar.locale = Locale(identifier: Locale.current.identifier)
    let components = calendar.dateComponents([.weekday], from: self)
    return components.weekday!
  }
  
  var weekdayOrdinalInt: Int {
    var calendar = Calendar(identifier: .gregorian)
    calendar.locale = Locale(identifier: Locale.current.identifier)
    let components = calendar.dateComponents([.weekdayOrdinal], from: self)
    return components.weekdayOrdinal!
  }
  
  var dayInt: Int {
    var calendar = Calendar(identifier: .gregorian)
    calendar.locale = Locale(identifier: Locale.current.identifier)
    let components = calendar.dateComponents([.day], from: self)
    return components.day!
  }
  
  var hourInt: Int {
    var calendar = Calendar(identifier: .gregorian)
    calendar.locale = Locale(identifier: Locale.current.identifier)
    let components = calendar.dateComponents([.hour], from: self)
    return components.hour!
  }
  
  var minuteInt: Int {
    var calendar = Calendar(identifier: .gregorian)
    calendar.locale = Locale(identifier: Locale.current.identifier)
    let components = calendar.dateComponents([.minute], from: self)
    return components.minute!
  }
  
  var secondInt: Int {
    var calendar = Calendar(identifier: .gregorian)
    calendar.locale = Locale(identifier: Locale.current.identifier)
    let components = calendar.dateComponents([.second], from: self)
    return components.second!
  }
  
  var nanosecondInt: Int {
    var calendar = Calendar(identifier: .gregorian)
    calendar.locale = Locale(identifier: Locale.current.identifier)
    let components = calendar.dateComponents([.nanosecond], from: self)
    return components.nanosecond!
  }
}
