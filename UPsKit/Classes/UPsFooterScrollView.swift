//
//  UPsFooterScrollView.swift
//  UPsKit
//
//  Created by YouUp Lee on 2022/12/12.
//

import UIKit

import SnapKit

public class UPsFooterScrollView: UIScrollView {
  
  // MARK: - Property
  
  private let baseView = UIView()
  public var contentsView = UIView()
  public var footerView = UIView()
  
  private let isFlexible: Bool
  
  
  
  // MARK: - Life Cycle
  
  public init(_ isFlexible: Bool = true) {
    self.isFlexible = isFlexible
    
    super.init(frame: .zero)
    
    self.setAttribute()
    self.setConstraint()
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  
  
  // MARK: - Interface
  
  @objc private func didTap(_ sender: UIButton) {
    self.endEditing(true)
  }
  
  
  
  // MARK: - UI
  
  private func setAttribute() {
    self.showsVerticalScrollIndicator = false
    self.showsHorizontalScrollIndicator = false
    
    if self.isFlexible {
      let tap = UITapGestureRecognizer()
      tap.addTarget(self, action: #selector(self.didTap(_:)))
      self.addGestureRecognizer(tap)
    }
    
    
    
    self.addSubview(self.baseView)
    
    [self.contentsView, self.footerView]
      .forEach(self.baseView.addSubview(_:))
  }
  
  private func setConstraint() {
    self.baseView.snp.makeConstraints { make in
      make.edges.equalToSuperview()
      make.width.equalToSuperview()
      
      switch self.isFlexible {
      case true:
        make.height.greaterThanOrEqualToSuperview()
        
      case false:
        make.height.equalToSuperview()
      }
    }
    
    self.contentsView.snp.makeConstraints { make in
      make.top.leading.trailing.equalToSuperview()
    }
    
    self.footerView.snp.makeConstraints { make in
      switch self.isFlexible {
      case true:
        make.top.greaterThanOrEqualTo(self.contentsView.snp.bottom).offset(24.0)
        
      case false:
        make.top.equalTo(self.contentsView.snp.bottom).offset(24.0)
      }
      
      make.leading.trailing.bottom.equalToSuperview()
    }
  }
}
