//
//  UPsShadowView.swift
//  UPsKit
//
//  Created by YouUp Lee on 2022/07/01.
//

import UIKit

public class UPsShadowView: UIView {
  
  // MARK: - Property
  
  private var isConfigure: Bool = true
  
  
  
  // MARK: - Override
  
  public override var bounds: CGRect {
    didSet {
      let shadowPath = UIBezierPath(rect: self.bounds)
      self.layer.shadowPath = shadowPath.cgPath
      self.configure()
    }
  }
  
  
  
  // MARK: - UI
  
  private func configure() {
    guard self.isConfigure else { return }
    self.isConfigure = false
    self.layer.shadowRadius = 5.0
    self.layer.shadowOpacity = 0.3
    self.layer.shadowOffset = .zero
    self.layer.shadowColor = UIColor.darkGray.cgColor
    self.layer.masksToBounds = false
  }
}
