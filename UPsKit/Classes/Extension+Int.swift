//
//  Extension+Int.swift
//  UPsKit
//
//  Created by Lee on 2022/05/26.
//

import Foundation

extension Int {
  
  public enum TimeerStyle {
    case HMSM
    case MSM
    case SM
  }
  
  public func inTimer(_ style: TimeerStyle) -> String {
    switch style {
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
}
