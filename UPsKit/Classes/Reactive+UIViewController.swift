//
//  Reactive+UIViewController.swift
//  UPsKit
//
//  Created by YouUp Lee on 2022/12/12.
//

import UIKit

import RxCocoa
import RxSwift

public extension Reactive where Base: UIViewController {
  
  var viewWillApper: Observable<Void> {
    return self.methodInvoked(#selector(UIViewController.viewWillAppear(_:)))
      .map { _ in }
  }
  
  var viewWillDisappear: Observable<Void> {
    return self.methodInvoked(#selector(UIViewController.viewWillDisappear(_:)))
      .map { _ in }
  }
  
  var viewDidAppear: Observable<Void> {
    return self.methodInvoked(#selector(UIViewController.viewDidAppear(_:)))
      .map { _ in }
  }
  
  var viewDidDisappear: Observable<Void> {
    return self.methodInvoked(#selector(UIViewController.viewDidDisappear(_:)))
      .map { _ in }
  }
  
  var viewDidLayoutSubviews: Observable<Void> {
    return self.methodInvoked(#selector(UIViewController.viewDidLayoutSubviews))
      .map { _ in }
  }
  
  var viewWillTransition: Observable<Void> {
    return self.methodInvoked(#selector(UIViewController.viewWillTransition(to:with:)))
      .map { _ in }
  }
  
  var delegate: DelegateProxy<UIViewController, UIAdaptivePresentationControllerDelegate> {
    return RxUIAdaptivePresentationControllerDelegateProxy.proxy(for: self.base)
  }
  
  var presentationControllerDidDismiss: Observable<UIPresentationController?> {
    return delegate
      .methodInvoked(#selector(UIAdaptivePresentationControllerDelegate.presentationControllerDidDismiss(_:)))
      .map { arr -> UIPresentationController? in
        return (arr.first as? UIPresentationController)
      }
  }
}



// MARK: - DelegateProxy

public class RxUIAdaptivePresentationControllerDelegateProxy: DelegateProxy<UIViewController, UIAdaptivePresentationControllerDelegate>, DelegateProxyType, UIAdaptivePresentationControllerDelegate {
  
  public static func registerKnownImplementations() {
    self.register { viewController -> RxUIAdaptivePresentationControllerDelegateProxy in
      RxUIAdaptivePresentationControllerDelegateProxy(parentObject: viewController, delegateProxy: self)
    }
  }
  
  public static func currentDelegate(for object: UIViewController) -> UIAdaptivePresentationControllerDelegate? {
    return object.navigationController?.presentationController?.delegate
  }
  
  public static func setCurrentDelegate(_ delegate: UIAdaptivePresentationControllerDelegate?, to object: UIViewController) {
    object.navigationController?.presentationController?.delegate = delegate
  }
}
