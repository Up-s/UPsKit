//
//  UPsAlertActionContentsProtocol.swift
//  UPsKit
//
//  Created by YouUp Lee on 2023/07/30.
//

import Foundation

public protocol UPsAlertActionContentsProtocol {
  
  var title: String { get }
  var testColor: UIColor { get }
  var handler: (() -> Void)? { get }
}


public struct UPsAlertActionContents: UPsAlertActionContentsProtocol {
  
  public var title: String
  public var testColor: UIColor
  public var handler: (() -> Void)?
  
  public init(title: String, testColor: UIColor = .gray900, handler: (() -> Void)? = nil) {
    self.title = title
    self.testColor = testColor
    self.handler = handler
  }
}
