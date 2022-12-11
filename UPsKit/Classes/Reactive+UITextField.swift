//
//  Reactive+UITextField.swift
//  UPsKit
//
//  Created by YouUp Lee on 2022/12/12.
//

import UIKit

import RxSwift

public extension Reactive where Base: UITextField {
    
    var becomeFirstResponder: Binder<Void> {
        return Binder(self.base) { textField, _ in
            textField.becomeFirstResponder()
        }
    }
    
    var resignFirstResponder: Binder<Void> {
        return Binder(self.base) { textField, _ in
            textField.resignFirstResponder()
        }
    }
}
