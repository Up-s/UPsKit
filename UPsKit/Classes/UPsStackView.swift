//
//  UPsStackView.swift
//  UPsKit
//
//  Created by YouUp Lee on 2022/07/06.
//

open class UPsStackView: UIStackView {
  
  public init(axis: NSLayoutConstraint.Axis, spacing: CGFloat = 0.0) {
    super.init(frame: .zero)
    
    self.axis = axis
    self.alignment = .fill
    self.distribution = .fill
    self.spacing = spacing
  }
  
  public init(axis: NSLayoutConstraint.Axis, alignment: UIStackView.Alignment? = nil, distribution: UIStackView.Distribution? = nil, spacing: CGFloat = 0.0) {
    super.init(frame: .zero)
    
    self.axis = axis
    
    if let temp = alignment {
      self.alignment = temp
    }
    
    if let temp = distribution {
      self.distribution = temp
    }
    
    self.spacing = spacing
  }
  
  required public init(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}
