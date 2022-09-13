//
//  Extension+Optional.swift
//  UPsKit
//
//  Created by YouUp Lee on 2022/09/13.
//

import Foundation

extension Optional where Wrapped == String {
  
  public func isEmpty() -> Bool {
    guard let text = self else { return true }
    return text.isEmpty
  }
}
