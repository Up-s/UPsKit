//
//  Extension+NSObject.swift
//  UPsKit
//
//  Created by UPs on 2022/09/10.
//

import Foundation

extension NSObject {
  
  var className: String { String(describing: type(of: self)) }
  
}
