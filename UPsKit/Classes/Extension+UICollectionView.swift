//
//  Extension+UICollectionView.swift
//  UPsKit
//
//  Created by UPs on 2022/09/10.
//

import UIKit

public extension UICollectionView {
  
  func register<C: UICollectionViewCell>(cellType: C.Type) where C: CellIdentifiable {
    register(cellType.self, forCellWithReuseIdentifier: cellType.identifier)
  }
  
  func dequeueReusableCell<C: UICollectionViewCell>(withCellType type: C.Type = C.self, forIndexPath indexPath: IndexPath) -> C where C: CellIdentifiable {
    guard let cell = dequeueReusableCell(withReuseIdentifier: type.identifier, for: indexPath) as? C
    else { fatalError("Couldn't dequeue a UICollectionViewCell with identifier: \(type.identifier)") }
    return cell
  }
}
