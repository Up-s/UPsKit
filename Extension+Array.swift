//
//  Extension+Array.swift
//  UPsKit
//
//  Created by YouUp Lee on 2023/06/23.
//

import Foundation

extension Array where Element ==  Int {
  
  var average: Int {
    self.reduce(0) { $0 + $1 } / self.count
  }
}


