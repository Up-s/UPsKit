//
//  Extension+String.swift
//  UPsKit
//
//  Created by Lee on 2022/05/26.
//

import Foundation

extension String {
  
  var localized: String {
    NSLocalizedString(self, tableName: "Localizable", value: self, comment: "")
  }
  
  func validateEmail() -> Bool {
    let emailRegEx = "^.+@([A-Za-z0-9-]+\\.)+[A-Za-z]{2}[A-Za-z]*$"
    let predicate = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
    return predicate.evaluate(with: self)
  }
  
  func validatePassword() -> Bool {
    let passwordRegEx = "^(?=.*[A-Z])(?=.*[0-9])(?=.*[a-z]).{8,16}$"
    let predicate = NSPredicate(format:"SELF MATCHES %@", passwordRegEx)
    return predicate.evaluate(with: self)
  }
}
