//
//  Extension+PHAsset.swift
//  UPsKit
//
//  Created by YouUp Lee on 2023/07/30.
//

import Foundation
import Photos

import RxSwift

extension ObservableType where Element == PHAsset {
  
  func assetToImage(_ requestOptions: PhotoRequestOptionsProtocol) -> Observable<UIImage?> {
    return self.flatMap { asset -> Observable<UIImage?> in
      Observable<UIImage?>.create { observable -> Disposable in
        let options = PHImageRequestOptions()
        options.isNetworkAccessAllowed = requestOptions.isNetworkAccessAllowed
        options.deliveryMode = requestOptions.deliveryMode
        options.isSynchronous = requestOptions.isSynchronous
        options.resizeMode = requestOptions.resizeMode
        options.version = requestOptions.version
//        options.progressHandler = { (progress, error, stop, info) in
//          print("\n--- asset iCloud progress ---------", progress)
//        }
        
        PHImageManager.default().requestImage(
          for: asset,
          targetSize: requestOptions.size,
          contentMode: .aspectFill,
          options: options
        ) { (image, _) in
          observable.onNext(image)
          observable.onCompleted()
        }
        
        return Disposables.create()
      }
    }
  }
}
