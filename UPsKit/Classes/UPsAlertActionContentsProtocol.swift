//
//  UPsAlertActionContentsProtocol.swift
//  UPsKit
//
//  Created by YouUp Lee on 2023/07/30.
//

import Foundation

public protocol UPsAlertActionContentsProtocol {
  
  var title: String { get }
  var titleColor: UIColor { get }
  var handler: (() -> Void)? { get }
}



public struct UPsAlertActionContents: UPsAlertActionContentsProtocol {
  
  public var title: String
  public var titleColor: UIColor
  public var handler: (() -> Void)?
  
  public init(
    title: String,
    titleColor: UIColor = .gray900,
    handler: (() -> Void)? = nil
  ) {
    self.title = title
    self.titleColor = titleColor
    self.handler = handler
  }
}
