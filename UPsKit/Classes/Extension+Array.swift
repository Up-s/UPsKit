//
//  Extension+Array.swift
//  UPsKit
//
//  Created by YouUp Lee on 2023/06/24.
//

import Foundation

public extension Array where Element == Int {
  
  var best: Int {
    let sortData = self.sorted { $0 < $1 }
    return sortData.first!
  }
  
  var worst: Int {
    let sortData = self.sorted { $0 < $1 }
    return sortData.last!
  }
  
  var average: Int {
    self.reduce(0) { $0 + $1 } / self.count
  }
  
  var rank: [Int] {
    let sortData = self.sorted { $0 < $1 }
    return self
      .compactMap { value in
        sortData.enumerated()
          .compactMap { i, v -> Int? in
            guard v == value else { return nil }
            return i + 1
          }
          .last
      }
  }
}
