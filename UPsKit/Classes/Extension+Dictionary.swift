//
//  Extension+Dictionary.swift
//  UPsKit
//
//  Created by YouUp Lee on 2023/07/05.
//

import Foundation

public extension Dictionary where Key == Int {
  
  func sortKey() -> [Value] {
    return self.keys
      .sorted()
      .compactMap { self[$0] }
  }
}
