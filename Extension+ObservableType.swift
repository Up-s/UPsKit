//
//  Extension+ObservableType.swift
//  UPsKit
//
//  Created by YouUp Lee on 2023/02/22.
//

import Foundation

import RxSwift
import RxCocoa

extension ObservableType {
  
  func ignoreAll() -> Observable<Void> {
    return map { _ in }
  }
  
  func unwrap<T>() -> Observable<T> where Element == T? {
    return compactMap { $0 }
  }
}
