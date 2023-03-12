//
//  Extension+ObservableType.swift
//  UPsKit
//
//  Created by YouUp Lee on 2023/03/12.
//

import Foundation

import RxSwift

extension ObservableType {
  
  func ignoreAll() -> Observable<Void> {
    return self.map { _ in }
  }
  
  func unwrap<T>() -> Observable<T> where Element == T? {
    return self.compactMap { $0 }
  }
}
