//
//  UPsPaddingLabel.swift
//  UPsKit
//
//  Created by YouUp Lee on 2022/06/26.
//

import UIKit

public class UPsPaddingLabel: UILabel {
  
  private var padding = UIEdgeInsets.zero
  
  convenience init(_ padding: UIEdgeInsets) {
    self.init()
    self.padding = padding
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
