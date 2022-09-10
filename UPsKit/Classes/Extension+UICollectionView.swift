//
//  Extension+UICollectionView.swift
//  UPsKit
//
//  Created by UPs on 2022/09/10.
//

import UIKit

import RxSwift

extension UICollectionView {
  
  public func register<C: UICollectionViewCell>(cellType: C.Type) where C: CellIdentifiable {
    register(cellType.self, forCellWithReuseIdentifier: cellType.identifier)
  }
  
  public func dequeueReusableCell<C: UICollectionViewCell>(withCellType type: C.Type = C.self, forIndexPath indexPath: IndexPath) -> C where C: CellIdentifiable {
    guard let cell = dequeueReusableCell(withReuseIdentifier: type.identifier, for: indexPath) as? C
    else { fatalError("Couldn't dequeue a UICollectionViewCell with identifier: \(type.identifier)") }
    return cell
  }
}



// MARK: - Reactive

extension Reactive where Base: UICollectionView {
  
  var reload: Binder<Void> {
    return Binder(self.base) { collectionView, _ in
      collectionView.reloadData()
    }
  }
}
