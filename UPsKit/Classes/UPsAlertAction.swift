//
//  UPsAlertAction.swift
//  UPsKit
//
//  Created by YouUp Lee on 2022/07/02.
//

import UIKit

public protocol UPsAlertActionProtocol {
  
  var title: String { get }
  var style: UIAlertAction.Style { get }
  var handler: ((UIAlertAction) -> Void)? { get }
}



public struct UPsAlertAction: UPsAlertActionProtocol {
  
  public let title: String
  public let style: UIAlertAction.Style
  public let handler: ((UIAlertAction) -> Void)?
  
  public init(
    title: String,
    style: UIAlertAction.Style = .default,
    handler: ((UIAlertAction) -> Void)? = nil
  ) {
    self.title = title
    self.style = style
    self.handler = handler
  }
}



public struct UPsAlertCancelAction: UPsAlertActionProtocol {
  
  public let title: String
  public let style: UIAlertAction.Style
  public let handler: ((UIAlertAction) -> Void)?
  
  public init(
    title: String = "닫기",
    style: UIAlertAction.Style = .cancel,
    handler: ((UIAlertAction) -> Void)? = nil
  ) {
    self.title = title
    self.style = style
    self.handler = handler
  }
}
