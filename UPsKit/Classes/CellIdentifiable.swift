//
//  CellIdentifiable.swift
//  UPsKit
//
//  Created by UPs on 2022/09/10.
//

import Foundation

public protocol CellIdentifiable {
  static var identifier: String { get }
}

extension CellIdentifiable {
  public static var identifier: String {
    return String(describing: self)
  }
}
