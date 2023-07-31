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
  var backgroundColor: UIColor { get }
  var handler: (() -> Void)? { get }
}



public struct UPsAlertActionContents: UPsAlertActionContentsProtocol {
  
  public var title: String
  public var titleColor: UIColor
  public var backgroundColor: UIColor
  public var handler: (() -> Void)?
  
  public init(
    title: String,
    titleColor: UIColor = .gray900,
    backgroundColor: UIColor = .light,
    handler: (() -> Void)? = nil
  ) {
    self.title = title
    self.titleColor = titleColor
    self.backgroundColor = backgroundColor
    self.handler = handler
  }
}
