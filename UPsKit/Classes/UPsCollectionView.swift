//
//  UPsCollectionView.swift
//  UPsKit
//
//  Created by UPs on 2022/12/17.
//

import UIKit

public class UPsCollectionView: UICollectionView {
  
  private let flowLayout = UICollectionViewFlowLayout()
  
  public init(scrollDirection: UICollectionView.ScrollDirection) {
    self.flowLayout.scrollDirection = scrollDirection
    super.init(frame: .zero, collectionViewLayout: flowLayout)
    
    self.backgroundColor = .back
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}
