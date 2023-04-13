//
//  Extension+Disposables.swift
//  UPsKit
//
//  Created by YouUp Lee on 2023/04/13.
//

import RxSwift

public extension Disposables {
  
  static func createHiddenIndicator() -> Cancelable {
    self.create {
      SceneCoordinator.shared.hiddenIndicatorView()
    }
  }
}
