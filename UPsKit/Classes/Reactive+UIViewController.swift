//
//  Reactive+UIViewController.swift
//  UPsKit
//
//  Created by YouUp Lee on 2022/12/12.
//

import UIKit

import RxCocoa
import RxSwift

extension Reactive where Base: UIViewController {
  
  public var viewWillApper: Observable<Void> {
    return self.methodInvoked(#selector(UIViewController.viewWillAppear(_:)))
      .map { _ in }
  }
  
  public var viewWillDisappear: Observable<Void> {
    return self.methodInvoked(#selector(UIViewController.viewWillDisappear(_:)))
      .map { _ in }
  }
  
  public var viewDidAppear: Observable<Void> {
    return self.methodInvoked(#selector(UIViewController.viewDidAppear(_:)))
      .map { _ in }
  }
  
  public var viewDidDisappear: Observable<Void> {
    return self.methodInvoked(#selector(UIViewController.viewDidDisappear(_:)))
      .map { _ in }
  }
  
  public var viewDidLayoutSubviews: Observable<Void> {
    return self.methodInvoked(#selector(UIViewController.viewDidLayoutSubviews))
      .map { _ in }
  }
  
  public var viewWillTransition: Observable<Void> {
    return self.methodInvoked(#selector(UIViewController.viewWillTransition(to:with:)))
      .map { _ in }
  }
  
  public var delegate: DelegateProxy<UIViewController, UIAdaptivePresentationControllerDelegate> {
    return RxUIAdaptivePresentationControllerDelegateProxy.proxy(for: self.base)
  }
  
  public var presentationControllerDidDismiss: Observable<UIPresentationController?> {
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
