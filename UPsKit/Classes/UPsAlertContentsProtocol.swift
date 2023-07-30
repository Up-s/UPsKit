//
//  UPsAlertContentsProtocol.swift
//  UPsKit
//
//  Created by YouUp Lee on 2023/07/30.
//

import Foundation

public protocol UPsAlertContentsProtocol {
  
  var title: String? { get }
  var meesage: String? { get }
  var close: String? { get }
  var action: [UPsAlertActionContentsProtocol] { get }
}



public struct UPsAlertContents: UPsAlertContentsProtocol {
  
  public var title: String?
  public var meesage: String?
  public var close: String?
  public var action: [UPsAlertActionContentsProtocol]
  
  public init(
    title: String? = nil,
    meesage: String? = nil,
    close: String? = nil,
    action: [UPsAlertActionContentsProtocol]
  ) {
    self.title = title
    self.meesage = meesage
    self.close = close
    self.action = action
  }
}
