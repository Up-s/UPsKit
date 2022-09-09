//
//  BaseNavigationView.swift
//  UPsKit
//
//  Created by UPs on 2022/09/10.
//

import UIKit

import SnapKit
import RxCocoa
import RxSwift

public class BaseNavigationView: UIStackView {
  
  public struct Metick {
    static let height: CGFloat = 44.0
    static let buttonWidth: CGFloat = 56.0
  }
  
  public enum InStyle {
    case back
    case dismiss
    case main
  }
  
  // MARK: - Property
  
  public let leftButton = UIButton()
  public let navTitleLabel = UILabel()
  public let rightButton = UIButton()
  
  private let inStyle: InStyle
  
  
  // MARK: - Life Cycle
  
  public init(_ inStyle: InStyle) {
    self.inStyle = inStyle
    
    super.init(frame: .zero)
    
    self.setAttribute()
    self.setConstraint()
  }
  
  required init(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  // MARK: - Interface
  
  public func updateStyle(_ style: InStyle) {
    
  }
  
  
  
  // MARK: - UI
  
  private func setAttribute() {
    self.axis = .horizontal
    self.alignment = .fill
    self.distribution = .fill
    self.spacing = 0
    self.backgroundColor = .clear
    
    self.navTitleLabel.font = .systemFont(ofSize: 20, weight: .bold)
    self.navTitleLabel.textColor = .black
    
    switch self.inStyle {
    case .back:
      let chevronLeft = UIImage(systemName: "chevron.left")
      self.leftButton.setImage(chevronLeft, for: .normal)
      self.leftButton.tintColor = .black
      
    case .dismiss:
      let chevronDown = UIImage(systemName: "chevron.down")
      self.leftButton.setImage(chevronDown, for: .normal)
      self.leftButton.tintColor = .black
      
    case .main:
      let gearshape = UIImage(systemName: "gearshape")
      self.leftButton.setImage(gearshape, for: .normal)
      self.leftButton.tintColor = .black
      
      let plus = UIImage(systemName: "plus")
      self.rightButton.setImage(plus, for: .normal)
      self.rightButton.tintColor = .black
    }
    
    [self.leftButton, self.navTitleLabel, self.rightButton]
      .forEach(self.addArrangedSubview(_:))
  }
  
  private func setConstraint() {
    self.snp.makeConstraints { make in
      make.height.equalTo(Metick.height)
    }
    
    [self.leftButton, self.rightButton].forEach {
      $0.snp.makeConstraints { make in
        make.width.equalTo(Metick.buttonWidth)
      }
    }
  }
}
