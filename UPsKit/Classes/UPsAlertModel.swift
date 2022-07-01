//
//  UPsAlertModel.swift
//  UPsKit
//
//  Created by YouUp Lee on 2022/07/02.
//

import UIKit

public struct UPsAlertBaseModel {
  
  let title: String?
  let message: String?
  let style: UIAlertController.Style
  let actions: [UPsAlertActionModel]
  
  public init(title: String? = nil, message: String? = nil, style: UIAlertController.Style = .alert, actions: [UPsAlertActionModel]) {
    self.title = title
    self.message = message
    self.style = style
    self.actions = actions
  }
}

public struct UPsAlertTextFieldModel {
  
  let title: String?
  let message: String?
  let keyboardType: UIKeyboardType
  let placeholder: String?
  let actionTitle: String
  let handler: ((String?) -> Void)?
  
  public init(title: String? = nil, message: String? = nil, keyboardType: UIKeyboardType = .default, placeholder: String? = nil, actionTitle: String, handler: ((String?) -> Void)? = nil) {
    self.title = title
    self.message = message
    self.keyboardType = keyboardType
    self.placeholder = placeholder
    self.actionTitle = actionTitle
    self.handler = handler
  }
}

public struct UPsAlertActionModel {
  
  let title: String
  let style: UIAlertAction.Style
  let handler: ((UIAlertAction) -> Void)?
  
  public init(title: String, style: UIAlertAction.Style = .default, handler: ((UIAlertAction) -> Void)? = nil) {
    self.title = title
    self.style = style
    self.handler = handler
  }
}
