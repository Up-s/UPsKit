//
//  Extension+String.swift
//  UPsKit
//
//  Created by Lee on 2022/05/26.
//

import Foundation

public extension String {
  
  var localized: String {
    NSLocalizedString(self, tableName: "Localizable", value: self, comment: "")
  }
  
  var isNickName: Bool {
    let nickNameRegEx = "[가-힣ㄱ-ㅎㅏ-ㅣa-zA-Z0-9]{2,20}$"
    let predicate = NSPredicate(format:"SELF MATCHES %@", nickNameRegEx)
    return predicate.evaluate(with: self)
  }
  
  var isValidEmail: Bool {
    let emailRegEx = "^.+@([A-Za-z0-9-]+\\.)+[A-Za-z]{2}[A-Za-z]*$"
    let predicate = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
    return predicate.evaluate(with: self)
  }
  
  var isValidPassword: Bool {
    let passwordRegEx = "^(?=.*[a-zA-Z])(?=.*[0-9])(?=.*[!@#$%^&*()_+=-]).{8,50}$"
    let predicate = NSPredicate(format:"SELF MATCHES %@", passwordRegEx)
    return predicate.evaluate(with: self)
  }
  
  func toDate(_ formatter: UPsFormatter.Date) -> Date? {
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = formatter.rawValue
    dateFormatter.locale = Locale(identifier: "ko_KR")
    return dateFormatter.date(from: self)
  }
  
  var removeComma: Int? {
    let removeString = self.replacingOccurrences(of: ",", with: "")
    return Int(removeString)
  }
  
  var removeHyphen: String {
    let removeString = self.replacingOccurrences(of: "-", with: "")
    return removeString
  }
  
  
  func numberPattern(pattern: UPsFormatter.Pattern) -> String {
    let replacmentCharacter: Character = "#"
    var pureNumber = self.replacingOccurrences( of: "[^0-9]", with: "", options: .regularExpression)
    for index in 0 ..< pattern.rawValue.count {
      guard index < pureNumber.count else { return pureNumber }
      let stringIndex = String.Index(utf16Offset: index, in: pattern.rawValue)
      let patternCharacter = pattern.rawValue[stringIndex]
      guard patternCharacter != replacmentCharacter else { continue }
      pureNumber.insert(patternCharacter, at: stringIndex)
    }
    return pureNumber
  }
}



// MARK: - Optional

public extension Optional where Wrapped == String {
  
  func isEmpty() -> Bool {
    guard let text = self else { return true }
    return text.isEmpty
  }
  
  var emptyToNil: String? {
    guard let self else { return nil }
    let text = self.isEmpty ? nil : self
    return text
  }
}
