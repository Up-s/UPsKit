//
//  SceneCoordinator.swift
//  UPsKit
//
//  Created by UPs on 2022/09/10.
//

import UIKit

import RxCocoa
import RxSwift

public class SceneCoordinator {
  
  public static var shared: SceneCoordinator!
  
  private var window: UIWindow
  private var currentVC: UIViewController
  private let disposeBag = DisposeBag()
  
  
  
  // MARK: - Life Cycle
  
  public init(window: UIWindow) {
    self.window = window
    self.currentVC = window.rootViewController ?? UIViewController()
  }
  
  
  
  // MARK: - Transition
  
  @discardableResult
  public func transition(scene: Scene, style: SceneTransitionStyle, animated: Bool = true) -> Completable {
    let subject = PublishSubject<Never>()
    let target = scene.viewController
    
    switch style {
    case .root:
      self.currentVC = target.sceneViewController
      let navi = UINavigationController(rootViewController: target)
      navi.navigationBar.isHidden = true
      self.window.rootViewController = navi
      
      subject.onCompleted()
      
      
      
    case .push:
      guard let nav = self.currentVC.navigationController else {
        subject.onError(TransitionError.navigationControllerMissing)
        break
      }
      
      nav.rx.willShow
        .withUnretained(self)
        .subscribe(onNext: { (coordinator, evt) in
          coordinator.currentVC = evt.viewController.sceneViewController })
        .disposed(by: disposeBag)
      
      nav.pushViewController(target, animated: animated)
      self.currentVC = target.sceneViewController
      
      subject.onCompleted()
      
      
      
    case .modal(let style):
      let navi = UINavigationController(rootViewController: target)
      navi.modalPresentationStyle = style
      navi.navigationBar.isHidden = true
      self.currentVC.present(navi, animated: animated) {
        subject.onCompleted()
      }
      
      self.currentVC = target.sceneViewController
    }
    
    return subject.asCompletable()
  }
  
  
  
  // MARK: - Toast
  
  public func showToast(_ title: String) {
    self.currentVC.showToast(title)
  }
  
  
  
  // MARK: - Alert
  
  public func alert(title: String? = nil, message: String? = nil, style: UIAlertController.Style = .alert, actions: [UPsAlertAction], completion: (() -> Void)? = nil) {
    self.currentVC.alert(title: title, message: message, style: style, actions: actions, completion: completion)
  }
  
  public func alertTextField(title: String? = nil, message: String? = nil, keyboardType: UIKeyboardType = .default, placeholder: String? = nil, actionTitle: String, cancel: String, handler: ((String?) -> Void)? = nil, completion: (() -> Void)? = nil) {
    self.currentVC.alertTextField(title: title, message: message, keyboardType: keyboardType, placeholder: placeholder, actionTitle: actionTitle, cancel: cancel, handler: handler, completion: completion)
  }
  
  
  
  // MARK: - adaptiveDismiss
  
  @discardableResult
  public func adaptiveDismiss(_ vc: UIViewController) -> Completable {
    let subject = PublishSubject<Never>()
    self.currentVC = vc
    subject.onCompleted()
    return subject.asCompletable()
  }
  
  
  
  // MARK: - Pop
  
  @discardableResult
  public func pop(animated: Bool = true) -> Completable {
    let subject = PublishSubject<Never>()
    
    guard let nav = self.currentVC.navigationController else {
      subject.onError(TransitionError.navigationControllerMissing)
      return subject.asCompletable()
    }
    guard nav.popViewController(animated: animated) != nil else {
      subject.onError(TransitionError.cannotPop)
      return subject.asCompletable()
    }
    
    self.currentVC = nav.viewControllers.last!.sceneViewController
    
    return subject.asCompletable()
  }
  
  
  
  // MARK: - Dismiss
  
  @discardableResult
  public func dismiss(animated: Bool = true) -> Completable {
    let subject = PublishSubject<Never>()
    
    guard let presentingVC = self.currentVC.presentingViewController else {
      subject.onError(TransitionError.unknown)
      return subject.asCompletable()
    }
    
    self.currentVC.dismiss(animated: animated) {
      self.currentVC = presentingVC.sceneViewController
      subject.onCompleted()
    }
    
    return subject.asCompletable()
  }
  
  
  
  // MARK: - Close
  
  @discardableResult
  public func close(animated: Bool) -> Completable {
    let subject = PublishSubject<Never>()
    
    if let presentingVC = self.currentVC.presentingViewController {
      self.currentVC.dismiss(animated: animated) {
        self.currentVC = presentingVC.sceneViewController
        subject.onCompleted()
      }

    } else if let nav = self.currentVC.navigationController {
      guard nav.popViewController(animated: animated) != nil else {
        subject.onError(TransitionError.cannotPop)
        return subject.asCompletable()
      }

      self.currentVC = nav.viewControllers.last!.sceneViewController
      subject.onCompleted()

    } else {
      subject.onError(TransitionError.unknown)
    }
    
    return subject.asCompletable()
  }
}
