//
//  UPsAlertContentsProtocol.swift
//  UPsKit
//
//  Created by YouUp Lee on 2023/07/30.
//

import Foundation

public protocol UPsAlertContentsProtocol {
  
  var title: String? { get }
  var sub: String? { get }
  var close: String? { get }
  var action: [UPsAlertActionContents] { get }
}



public struct UPsAlertContents: UPsAlertContentsProtocol {
  
  public var title: String?
  public var sub: String?
  public var close: String?
  public var action: [UPsAlertActionContents]
  
  public init(
    title: String? = nil,
    sub: String? = nil,
    close: String? = nil,
    action: [UPsAlertActionContents]
  ) {
    self.title = title
    self.sub = sub
    self.close = close
    self.action = action
  }
}
