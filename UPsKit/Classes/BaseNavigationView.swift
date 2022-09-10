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

public class BaseNavigationView: UIView {
  
  public struct Metric {
    static let height: CGFloat = 48.0
    static let buttonWidth: CGFloat = 48.0
    static let spacing: CGFloat = 12.0
  }
  
  public enum InStyle {
    case none
    case back
    case dismiss
  }
  
  public enum Direction {
    case left
    case right
  }
  
  // MARK: - Property
  
  private let contentStackView = UPsStackView(axis: .horizontal)
  private let leftStackView = UPsStackView(axis: .horizontal, spacing: Metric.spacing)
  private let rightStackView = UPsStackView(axis: .horizontal, spacing: Metric.spacing)
  
  public let leftButton = UIButton()
  public let navTitleLabel = UILabel()
  
  private let inStyle: InStyle
  
  
  
  // MARK: - Life Cycle
  
  public init(_ inStyle: InStyle = .none) {
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
  
  public func addImageButton(_ button: UIButton, _ direction: Direction) {
    switch direction {
    case .left:
      self.leftStackView.addArrangedSubview(button)
      
    case .right:
      self.rightStackView.addArrangedSubview(button)
    }
    
    button.snp.makeConstraints { make in
      make.width.greaterThanOrEqualTo(Metric.buttonWidth)
    }
  }
  
  public func addTextButton(_ button: UIButton, _ direction: Direction) {
    switch direction {
    case .left:
      self.leftStackView.addArrangedSubview(button)
      
    case .right:
      self.rightStackView.addArrangedSubview(button)
    }
  }
  
  
  
  // MARK: - UI
  
  private func setAttribute() {
    self.backgroundColor = .clear
    
    self.navTitleLabel.font = .systemFont(ofSize: 20, weight: .bold)
    self.navTitleLabel.textColor = .black
    
    switch self.inStyle {
    case .none:
      break
      
    case .back:
      let chevronLeft = UIImage(systemName: "chevron.left")
      self.leftButton.setImage(chevronLeft, for: .normal)
      self.leftButton.tintColor = .black
      self.leftStackView.addArrangedSubview(self.leftButton)
      
    case .dismiss:
      let chevronDown = UIImage(systemName: "chevron.down")
      self.leftButton.setImage(chevronDown, for: .normal)
      self.leftButton.tintColor = .black
      self.leftStackView.addArrangedSubview(self.leftButton)
    }
    
    
    
    self.addSubview(self.contentStackView)

    [self.leftStackView, self.navTitleLabel, self.rightStackView]
      .forEach(self.contentStackView.addArrangedSubview(_:))
  }
  
  private func setConstraint() {
    self.snp.makeConstraints { make in
      make.height.equalTo(Metric.height)
    }
    
    self.contentStackView.snp.makeConstraints { make in
      make.top.bottom.equalToSuperview()
      make.leading.trailing.equalToSuperview().inset(8.0)
    }

    self.leftButton.snp.makeConstraints { make in
      make.width.equalTo(Metric.buttonWidth)
    }
  }
}
