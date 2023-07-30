//
//  UPsAlertActionButton.swift
//  UPsKit
//
//  Created by YouUp Lee on 2023/07/30.
//

import UIKit

import SnapKit

public class UPsAlertActionButton: UIButton {
  
  // MARK: - Property
  
  private let contents: UPsAlertActionContents
  
  
  
  // MARK: - Life Cycle
  
  public init(_ contents: UPsAlertActionContents) {
    self.contents = contents
    
    super.init(frame: .zero)
    
    self.addTarget(self, action: #selector(self.didTap(_:)), for: .touchUpInside)
    self.setTitle(contents.title, for: .normal)
    self.setTitleColor(contents.titleColor, for: .normal)
    self.backgroundColor = .light
    self.setCornerRadius(8.0)
    
    self.snp.makeConstraints { make in
      make.height.equalTo(52.0)
    }
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  
  
  // MARK: - Interface
  
  @objc private func didTap(_ sender: UIButton) {
    self.contents.handler?()
  }
}
