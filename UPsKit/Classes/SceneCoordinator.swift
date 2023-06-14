//
//  SceneCoordinator.swift
//  UPsKit
//
//  Created by UPs on 2022/09/10.
//

import UIKit

import RxCocoa
import RxSwift
import SnapKit

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
  public func transition(scene: SceneProtocol, style: SceneTransitionStyle, animated: Bool = true) -> Completable {
    let subject = PublishSubject<Never>()
    let target = scene.target
    
    switch style {
    case .root:
      let navi = UINavigationController(rootViewController: target)
      navi.navigationBar.isHidden = true
      self.window.rootViewController = navi
      self.currentVC = target
      subject.onCompleted()
      
    case .push:
      guard let navi = self.currentVC.navigationController else {
        subject.onError(TransitionError.navigationControllerMissing)
        break
      }
      navi.rx.willShow
        .withUnretained(self)
        .subscribe(onNext: { (coordinator, evt) in
          coordinator.currentVC = evt.viewController
        })
        .disposed(by: disposeBag)
      navi.pushViewController(target, animated: animated)
      self.currentVC = target
      subject.onCompleted()
      
    case .modal(let style):
      let navi = UINavigationController(rootViewController: target)
      navi.modalPresentationStyle = style
      navi.navigationBar.isHidden = true
      self.currentVC.present(navi, animated: animated) {
        subject.onCompleted()
      }
      self.currentVC = target
    }
    
    return subject.asCompletable()
  }
  
  
  
  // MARK: - Toast
  
  public func toast(_ title: String) {
    self.currentVC.toast(title)
  }
  
  
  
  // MARK: - Alert
  
  public func alert(title: String? = nil, message: String? = nil, style: UIAlertController.Style = .alert, actions: [UPsAlertActionProtocol], completion: (() -> Void)? = nil) {
    self.currentVC.alert(title: title, message: message, style: style, actions: actions, completion: completion)
  }
  
  public func alertTextField(title: String? = nil, message: String? = nil, keyboardType: UIKeyboardType = .default, placeholder: String? = nil, actionTitle: String, cancel: String, handler: ((String?) -> Void)? = nil, completion: (() -> Void)? = nil) {
    self.currentVC.alertTextField(title: title, message: message, keyboardType: keyboardType, placeholder: placeholder, actionTitle: actionTitle, cancel: cancel, handler: handler, completion: completion)
  }
  
  
  
  // MARK: - Indicator
  
  private var indicatorView: UIView?
  
  @discardableResult
  public func showIndicatorView() -> Completable {
    let subject = PublishSubject<Never>()
    
    guard self.indicatorView == nil else {
      subject.onCompleted()
      return subject.asCompletable()
    }
    
    let vIndicator = IndicatorView()
    self.indicatorView = vIndicator
    self.currentVC.view.addSubview(vIndicator)
    vIndicator.snp.makeConstraints { make in
      make.edges.equalToSuperview()
    }
    
    subject.onCompleted()
    return subject.asCompletable()
  }
  
  @discardableResult
  public func hiddenIndicatorView() -> Completable {
    let subject = PublishSubject<Never>()
    
    self.indicatorView?.removeFromSuperview()
    self.indicatorView = nil
    
    subject.onCompleted()
    return subject.asCompletable()
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
    
    guard let navi = self.currentVC.navigationController else {
      subject.onError(TransitionError.navigationControllerMissing)
      return subject.asCompletable()
    }
    guard navi.popViewController(animated: animated) != nil else {
      subject.onError(TransitionError.cannotPop)
      return subject.asCompletable()
    }
    
    self.currentVC = navi.viewControllers.last!
    
    return subject.asCompletable()
  }
  
  @discardableResult
  public func popAll(animated: Bool = true) -> Completable {
    let subject = PublishSubject<Never>()
    
    guard let navi = self.currentVC.navigationController else {
      subject.onError(TransitionError.navigationControllerMissing)
      return subject.asCompletable()
    }
    
    guard navi.popToRootViewController(animated: animated) != nil else {
      subject.onError(TransitionError.cannotPop)
      return subject.asCompletable()
    }
    
    self.currentVC = navi.viewControllers.last!
    
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

    } else if let navi = self.currentVC.navigationController {
      guard navi.popViewController(animated: animated) != nil else {
        subject.onError(TransitionError.cannotPop)
        return subject.asCompletable()
      }

      self.currentVC = navi.viewControllers.last!.sceneViewController
      subject.onCompleted()

    } else {
      subject.onError(TransitionError.unknown)
    }
    
    return subject.asCompletable()
  }
  
  
  
  // MARK: - Actual
  
  @discardableResult
  public func actualViewController(for viewController: UIViewController) -> UIViewController {
    var controller = viewController
    if let tabBarController = controller as? UITabBarController {
      guard let selectedViewController = tabBarController.selectedViewController else {
        return tabBarController
      }
      controller = selectedViewController
      
      return self.actualViewController(for: controller)
    }
    
    if let navigationController = viewController as? UINavigationController {
      controller = navigationController.viewControllers.first!
      
      return self.actualViewController(for: controller)
    }
    
    return controller
  }
}
