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
  
  
  
  deinit {
      print("🎉🎉🎉 deinit: \(self.className) 🎉🎉🎉")
  }
  
  
  
  // MARK: - Interface
  
  func setKeyboardNotification() {
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
