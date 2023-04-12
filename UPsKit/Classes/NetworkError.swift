//
//  NetworkError.swift
//  UPsKit
//
//  Created by YouUp Lee on 2023/03/12.
//

import Foundation

public enum NetworkError: Error {
  
  case isEmailVerified
  case emptyData
  case firebaseError(Error)
  case networkError(Error)
  case parsingError
}
