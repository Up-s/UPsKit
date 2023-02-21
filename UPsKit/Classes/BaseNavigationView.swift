//
//  BaseNavigationView.swift
//  UPsKit
//
//  Created by UPs on 2022/09/10.
//

import UIKit

import RxCocoa
import RxSwift
import SnapKit

public class BaseNavigationView: UIView {
  
  public enum InStyle {
    case none
    case pop
    case dismiss
  }
  
  // MARK: - Property
  
  private let contentStackView = UPsStackView(axis: .horizontal, spacing: Metric.spacing)
  private let leftStackView = UPsStackView(axis: .horizontal, spacing: Metric.spacing)
  private let rightStackView = UPsStackView(axis: .horizontal, spacing: Metric.spacing)
  
  public let leftButton = UIButton()
  public let titleLabel = UILabel()
  
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
  
  public func addNavigationLeftStackView(_ addView: UIView) {
    self.leftStackView.addArrangedSubview(addView)
  }
  
  public func addNavigationRightStackView(_ addView: UIView) {
    if self.rightStackView.superview == nil {
      self.contentStackView.addArrangedSubview(self.rightStackView)
    }
    
    if addView is UIButton {
      addView.snp.makeConstraints { make in
        make.width.equalTo(Metric.buttonWidth)
      }
    }
    
    self.rightStackView.addArrangedSubview(addView)
  }
  
  
  
  // MARK: - UI
  
  private func setAttribute() {
    self.backgroundColor = .clear
    
    self.titleLabel.font = .systemFont(ofSize: 20, weight: .bold)
    self.titleLabel.textColor = .gray900
    
    switch self.inStyle {
    case .none:
      self.titleLabel.textAlignment = .left
      
    case .pop:
      self.contentStackView.addArrangedSubview(self.leftStackView)
      let chevronLeft = UIImage.sfConfiguration(name: "chevron.left")
      self.leftButton.setImage(chevronLeft, for: .normal)
      self.leftStackView.addArrangedSubview(self.leftButton)
      
    case .dismiss:
      self.contentStackView.addArrangedSubview(self.leftStackView)
      let chevronDown = UIImage.sfConfiguration(name: "chevron.down")
      self.leftButton.setImage(chevronDown, for: .normal)
      self.leftStackView.addArrangedSubview(self.leftButton)
    }
    
    self.addSubview(self.contentStackView)
    
    self.contentStackView.addArrangedSubview(self.titleLabel)
  }
  
  private func setConstraint() {
    self.snp.makeConstraints { make in
      make.height.equalTo(Metric.height)
    }
    
    self.contentStackView.snp.makeConstraints { make in
      make.top.bottom.equalToSuperview()
      make.leading.trailing.equalToSuperview().inset(18.0)
    }
    
    self.leftButton.snp.makeConstraints { make in
      make.width.equalTo(Metric.buttonWidth)
    }
  }
  
  public struct Metric {
    static let height: CGFloat = 54.0
    static let buttonWidth: CGFloat = 32.0
    static let spacing: CGFloat = 14.0
  }
}
