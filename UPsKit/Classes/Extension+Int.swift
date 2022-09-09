//
//  Extension+Int.swift
//  UPsKit
//
//  Created by Lee on 2022/05/26.
//

import Foundation

extension Int {
  
  public func toTimer(_ formatter: UPsFormatter.Timer) -> String {
    switch formatter {
    case .HM:
      let min = ((self / 100) / 60) % 60
      let hour = (((self / 100) / 60) / 60) % 60
      return String(format: "%d.%02d", hour, min)
      
    case .HMSM:
      let millisec = self % 100
      let sec = (self / 100) % 60
      let min = ((self / 100) / 60) % 60
      let hour = (((self / 100) / 60) / 60) % 60
      return String(format: "%d: %02d : %02d . %02d", hour, min, sec, millisec)
      
    case .MSM:
      let millisec = self % 100
      let sec = (self / 100) % 60
      let min = ((self / 100) / 60) % 60
      return String(format: "%02d : %02d . %02d", min, sec, millisec)
      
    case .SM:
      let millisec = self % 100
      let sec = (self / 100) % 60
      return String(format: "%02d . %02d", sec, millisec)
    }
  }
  
  public var toWon: String {
    let numberFormatter = NumberFormatter()
    numberFormatter.numberStyle = .decimal
    return numberFormatter.string(from: self as NSNumber) ?? "0"
  }
  
  public var toHour: String {
    switch self > 60 {
    case true:
      let hour = self / 60
      let min = self % 60
      return String(format: "%d시 %d분", hour, min)
      
    case false:
      let min = self % 60
      return String(format: "%d분", min)
    }
  }
}
