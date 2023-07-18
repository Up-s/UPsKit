//
//  BaseViewController.swift
//  UPsKit
//
//  Created by UPs on 2022/09/09.
//

import UIKit

import RxCocoa
import RxSwift

open class BaseViewController: UIViewController {
  
  public let disposeBag = DisposeBag()
  
  public let endEditing = PublishRelay<Void>()
  
  
  
  public init() {
    super.init(nibName: nil, bundle: nil)
    
    
    self.endEditing
      .bind { [weak self] in
        self?.view.endEditing(true)
      }
      .disposed(by: self.disposeBag)
  }
  
  required public init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  deinit {
    print("🎉🎉🎉 deinit: \(self.className) 🎉🎉🎉")
  }
  
  
  
  // MARK: - Interface
  
  public func setKeyboardNotification() {
    self.rx.viewDidAppear
      .compactMap { [weak self] _ -> BaseView? in
        return self?.view as? BaseView
      }
      .bind { rootView in
        rootView.addKeyboardNotification()
      }
      .disposed(by: self.disposeBag)
    
    self.rx.viewDidDisappear
      .compactMap { [weak self] _ -> BaseView? in
        return self?.view as? BaseView
      }
      .bind { rootView in
        rootView.removeKeyboardNotification()
      }
      .disposed(by: self.disposeBag)
  }
}
