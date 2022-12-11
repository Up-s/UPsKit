//
//  Extension+NSObject.swift
//  UPsKit
//
//  Created by UPs on 2022/09/10.
//

import Foundation

public extension NSObject {
  
  var className: String { String(describing: type(of: self)) }
  
  func debugLog(_ function: String, _ line: Int, _ error: Error) {
    print("\n😱😱😱😱😱 [class: \(self.className))] [func: \(function)] [line: \(line)] [error: \(error.localizedDescription)]\n")
    
    #if DEBUG
    SceneCoordinator.shared.toast(error.localizedDescription)
    #endif
  }
}
