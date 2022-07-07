//
//  UPsPaddingLabel.swift
//  UPsKit
//
//  Created by YouUp Lee on 2022/06/26.
//

import UIKit

public class UPsPaddingLabel: UILabel {
  
  // MARK: - Property
  
  private var padding = UIEdgeInsets.zero
  
  
  
  // MARK: - Life Cycle
  
  public convenience init(x: CGFloat, y: CGFloat) {
    self.init()
    self.padding = UIEdgeInsets(x: x, y: y)
  }
  
  
  public convenience init(all: CGFloat) {
    self.init()
    self.padding = UIEdgeInsets(all: all)
  }
  
  
  public override func drawText(in rect: CGRect) {
    super.drawText(in: rect.inset(by: self.padding))
  }
  
  public override var intrinsicContentSize: CGSize {
    var contentSize = super.intrinsicContentSize
    contentSize.height += self.padding.top + self.padding.bottom
    contentSize.width += self.padding.left + self.padding.right
    return contentSize
  }
}
