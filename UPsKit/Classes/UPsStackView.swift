//
//  UPsStackView.swift
//  UPsKit
//
//  Created by YouUp Lee on 2022/07/06.
//

open class UPsStackView: UIStackView {
  
  public init(
    axis: NSLayoutConstraint.Axis,
    alignment: UIStackView.Alignment? = nil,
    distribution: UIStackView.Distribution? = nil,
    spacing: CGFloat = 0.0,
    margin: UIEdgeInsets? = nil
  ) {
    super.init(frame: .zero)
    
    self.axis = axis
    
    if let alignment = alignment {
      self.alignment = alignment
    }
    
    if let distribution = distribution {
      self.distribution = distribution
    }
    
    self.spacing = spacing
    
    if let margin = margin {
      self.isLayoutMarginsRelativeArrangement = true
      self.layoutMargins = margin
    }
  }
  
  required public init(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}
