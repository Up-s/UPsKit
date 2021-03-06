//
//  DebugLog.swift
//  UPsKit
//
//  Created by YouUp Lee on 2022/07/03.
//

import Foundation

final class DebugLog {
  
  @discardableResult
  public init(c: String? = nil, f: String? = nil, l: Int? = nil, e: Error? = nil) {
    print("\nš±š±š±š±š± [class: \(c ?? "empty")] [func: \(f ?? "empty")] [line: \(l ?? 0)] [error: \(e?.localizedDescription ?? "empty")]\n")
  }
}
