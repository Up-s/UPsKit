//
//  Extension+Optional.swift
//  UPsKit
//
//  Created by YouUp Lee on 2022/09/11.
//

import Foundation

extension Optional where Wrapped == String {
  
  func isEmpty() -> Bool {
    guard let text = self else { return true }
    return text.isEmpty
  }
}
