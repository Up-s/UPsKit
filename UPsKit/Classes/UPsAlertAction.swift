//
//  UPsAlertAction.swift
//  UPsKit
//
//  Created by YouUp Lee on 2022/07/02.
//

import UIKit

public struct UPsAlertAction {
  
  public let title: String
  public let style: UIAlertAction.Style
  public let handler: ((UIAlertAction) -> Void)?
  
  public init(title: String, style: UIAlertAction.Style = .default, handler: ((UIAlertAction) -> Void)? = nil) {
    self.title = title
    self.style = style
    self.handler = handler
  }
  
  public static func cancel(_ title: String = "닫기") -> UPsAlertAction {
    UPsAlertAction(title: title)
  }
}
