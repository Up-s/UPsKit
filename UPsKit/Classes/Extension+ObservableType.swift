//
//  Extension+ObservableType.swift
//  UPsKit
//
//  Created by YouUp Lee on 2023/03/12.
//

import Foundation
import Photos

import RxSwift

public extension ObservableType {
  
  func ignoreAll() -> Observable<Void> {
    return self.map { _ in }
  }
  
  func unwrap<T>() -> Observable<T> where Element == T? {
    return self.compactMap { $0 }
  }
  
  func catchNetworkError() -> Observable<Element> {
    return self.`catch` { error -> Observable<Element> in
      let networError = error as? NetworkError
      
      let message: String
      
      switch networError {
      case .none:
        message = error.localizedDescription
        
      case .isEmailVerified:
        message = "이메일 인증을 완료해 주세요"
        
      case .emptyData:
        message = "Empty Data"
        
      case .firebaseError(let error):
        message = error.localizedDescription
        
      case .networkError(let error):
        message = error.localizedDescription
        
      case .parsingError:
        message = "Parsing Error"
      }
      
      SceneCoordinator.shared.toast(message)
      
      return Observable.empty()
    }
  }
  
  func albumPermission() -> Observable<Bool> {
    return self.flatMap { _ -> Observable<Bool> in
      Observable<Bool>.create { observable -> Disposable in
        PHPhotoLibrary.requestAuthorization { status in
          switch status {
          case .authorized:
            observable.onNext(true)
          default:
            observable.onNext(false)
          }
          observable.onCompleted()
        }
        return Disposables.create()
      }
    }
  }
}
