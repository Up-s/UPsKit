//
//  Extension+DateComponents.swift
//  UPsKit
//
//  Created by YouUp Lee on 2022/07/03.
//

import Foundation

extension DateComponents {
  
  public var getHour: String {
    String(format: "%02d", self.hour!)
  }
  
  public var getMin: String {
    String(format: "%02d", self.minute!)
  }
  
  public var getSec: String {
    String(format: "%02d", self.second!)
  }
  
  public var getNano: String {
    String(format: "%02d", (self.nanosecond! / 10000000))
  }
}
