//
//  UPsLeftAlignCollectionView.swift
//  UPsKit
//
//  Created by YouUp Lee on 2022/06/26.
//

import UIKit

public class UPsLeftAlignCollectionView: UICollectionView {
  
  public init(_ scrollDirection: UICollectionView.ScrollDirection) {
    let layout = CollectionViewLeftAlignFlowLayout()
    layout.scrollDirection = scrollDirection
    layout.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
    super.init(frame: .zero, collectionViewLayout: layout)
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}


// MARK: - UICollectionViewFlowLayout

final class CollectionViewLeftAlignFlowLayout: UICollectionViewFlowLayout {
  
  private let cellSpacing: CGFloat = 10
  
  override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
    self.minimumLineSpacing = 10.0
    self.sectionInset = UIEdgeInsets(top: 12.0, left: 16.0, bottom: 12.0, right: 16.0)
    let attributes = super.layoutAttributesForElements(in: rect)
    var leftMargin = sectionInset.left
    var maxY: CGFloat = -1.0
    attributes?.forEach { layoutAttribute in
      if layoutAttribute.frame.origin.y >= maxY {
        leftMargin = sectionInset.left
      }
      layoutAttribute.frame.origin.x = leftMargin
      leftMargin += layoutAttribute.frame.width + self.cellSpacing
      maxY = max(layoutAttribute.frame.maxY, maxY)
    }
    return attributes
  }
}
