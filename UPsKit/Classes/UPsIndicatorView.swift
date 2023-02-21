//
//  UPsIndicatorView.swift
//  UPsKit
//
//  Created by YouUp Lee on 2023/02/22.
//

import UIKit

import SnapKit

final class IndicatorView: UIView {
  
  // MARK: - Property
  
  private let indicator = UIActivityIndicatorView()
  
  
  
  // MARK: - Life Cycle
  
  init() {
    super.init(frame: .zero)
    
    self.setAttribute()
    self.setConstraint()
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  deinit {
    print("🎉🎉🎉 deinit: \(self.className) 🎉🎉🎉")
  }
  
  
  
  // MARK: - Interface
  
  
  
  // MARK: - UI
  
  private func setAttribute() {
    self.backgroundColor = .gray900.withAlphaComponent(0.4)
    
    self.indicator.startAnimating()
    self.indicator.style = .large
    self.indicator.color = .gray100
    self.addSubview(self.indicator)
  }
  
  private func setConstraint() {
    self.indicator.snp.makeConstraints { make in
      make.center.equalToSuperview()
    }
  }
}
