//
//  Extension+DateComponents.swift
//  UPsKit
//
//  Created by YouUp Lee on 2022/07/03.
//

import Foundation

public extension DateComponents {
  
  var getHour: String {
    String(format: "%02d", self.hour!)
  }
  
  var getMin: String {
    String(format: "%02d", self.minute!)
  }
  
  var getSec: String {
    String(format: "%02d", self.second!)
  }
  
  var getNano: String {
    String(format: "%02d", (self.nanosecond! / 10000000))
  }
}
