//
//  BaseViewModel.swift
//  UPsKit
//
//  Created by UPs on 2022/09/09.
//

import Foundation

import RxCocoa
import RxSwift

public class BaseViewModel: NSObject {
  
  public struct Base {
    let backDidTap = PublishRelay<Void>()
    let dismissDidTap = PublishRelay<Void>()
    let adaptiveDismiss = PublishRelay<UIPresentationController?>()
    let networkError = PublishRelay<Error>()
  }
  
  public let base = Base()
  
  
  public let coordinator: SceneCoordinator
  public let disposeBag: DisposeBag
  
  
  
  
  deinit {
    print("🎉🎉🎉 deinit: \(self.className) 🎉🎉🎉")
  }
  
  public init(_ sceneCoordinator: SceneCoordinator = SceneCoordinator.shared) {
    self.coordinator = sceneCoordinator
    self.disposeBag = DisposeBag()
    
    super.init()
    
    self.base.backDidTap
      .bind { [weak self] _ in
        self?.coordinator.pop()
      }
      .disposed(by: self.disposeBag)
    
    self.base.dismissDidTap
      .bind { [weak self] _ in
        self?.coordinator.dismiss()
      }
      .disposed(by: self.disposeBag)
    
    self.base.adaptiveDismiss
      .compactMap { presentationController -> UIViewController? in
        let navi = presentationController?.presentingViewController as? UINavigationController
        return navi?.viewControllers.last
      }
      .bind { [weak self] in
        self?.coordinator.adaptiveDismiss($0)
      }
      .disposed(by: self.disposeBag)
    
    self.base.networkError
      .bind { [weak self] error in
        self?.coordinator.showToast(error.localizedDescription)
      }
      .disposed(by: self.disposeBag)
  }
}
