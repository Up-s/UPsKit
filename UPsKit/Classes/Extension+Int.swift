//
//  Extension+Int.swift
//  UPsKit
//
//  Created by Lee on 2022/05/26.
//

import Foundation

import RxSwift

public extension Int {
  
  func toTime() -> String {
    var millisec = self * 1000
    
    let day = millisec / (24 * 3600 * 1000)
    millisec -= day * (24 * 3600 * 1000)
    let hour = millisec / (3600 * 1000)
    millisec -= hour * (3600 * 1000)
    let min = millisec / (60 * 1000)
    millisec -= min * (60 * 1000)
    let sec = millisec / 1000
    
    if day > 0 {
      return String(format:"%d일 %d시 %d분 %d초", day, hour, min, sec)
      
    } else if hour > 0 {
      return String(format:"%d시 %d분 %d초", hour, min, sec)
      
    } else if min > 0 {
      return String(format:"%d분 %d초", min, sec)
      
    } else {
      return String(format:"%d초", sec)
    }
  }
  
  func toTimer(_ formatter: UPsFormatter.Timer) -> String {
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
  
  var toWon: String {
    let numberFormatter = NumberFormatter()
    numberFormatter.numberStyle = .decimal
    return numberFormatter.string(from: self as NSNumber) ?? "0"
  }
  
  var toHour: String {
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



// MARK: - ObservableType

// 0.01 기준

public extension ObservableType where Element == Int {
  
  func fullTimer() -> Observable<String> {
    return map { time in
      let millisec = time % 100
      let sec = (time / 100) % 60
      let min = ((time / 100) / 60) % 60
      let hour = (((time / 100) / 60) / 60) % 60
      return String(format: "%d: %02d : %02d . %02d", hour, min, sec, millisec)
    }
  }
  
  func hour() -> Observable<String> {
    return map { time in
      let hour = (((time / 100) / 60) / 60) % 60
      return String(format: "%02d", hour)
    }
  }
  
  func min() -> Observable<String> {
    return map { time in
      let min = ((time / 100) / 60) % 60
      return String(format: "%02d", min)
    }
  }
  
  func sec() -> Observable<String> {
    return map { time in
      let sec = (time / 100) % 60
      return String(format: "%02d", sec)
    }
  }
  
  func millisec() -> Observable<String> {
    return map { time in
      let millisec = time % 100
      return String(format: "%02d", millisec)
    }
  }
  
  
  
  func timerFull() -> Observable<String> {
    return map { time in
      let millisec = time % 100
      let sec = (time / 100) % 60
      let min = ((time / 100) / 60) % 60
      return String(format: "%02d : %02d . %02d", min, sec, millisec)
    }
  }
  
  func timerLap() -> Observable<String> {
    return map { time in
      let millisec = time % 100
      let sec = (time / 100) % 60
      return String(format: "%02d . %02d", sec, millisec)
    }
  }
}
