//
//  Reactive+UIButton.swift
//  UPsKit
//
//  Created by YouUp Lee on 2023/08/10.
//

import UIKit

import RxSwift

public extension Reactive where Base: UIButton {
  
  var isActivated: Binder<Bool> {
    return Binder(self.base) { view, isStatus in
      view.isEnabled = isStatus
      
      switch isStatus {
      case true:
        view.setTitleColor(.white, for: .normal)
        view.backgroundColor = .systemBlue
        
      case false:
        view.setTitleColor(.gray900, for: .normal)
        view.backgroundColor = .gray300
      }
    }
  }
}
