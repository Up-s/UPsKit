//
//  Reactive+UICollectionView.swift
//  UPsKit
//
//  Created by YouUp Lee on 2022/12/12.
//

import Foundation

import RxSwift

public extension Reactive where Base: UICollectionView {
  
  var reload: Binder<Void> {
    return Binder(self.base) { collectionView, _ in
      collectionView.reloadData()
    }
  }
  
  var performBatchUpdates: Observable<Void> {
    return Observable<Void>.create { observer in
      self.base.performBatchUpdates {
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
          observer.onNext(())
          observer.onCompleted()
        }
      }
      return Disposables.create()
    }
  }
}
