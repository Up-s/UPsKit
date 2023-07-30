//
//  UPsAlertView.swift
//  UPsKit
//
//  Created by YouUp Lee on 2023/07/30.
//

import UIKit

import SnapKit
import Then

public class UPsAlertView: UIView {
  
  // MARK: - Property
  
  private let contentsStackView = UPsStackView(axis: .vertical)
  private let infoStackView = UPsStackView(axis: .vertical, spacing: 8.0, margin: UIEdgeInsets(all: 16.0))
  private let titleLabel = UILabel().then { view in
    view.font = .boldSystemFont(ofSize: 20.0)
    view.textColor = .gray900
    view.numberOfLines = 0
  }
  private let subLabel = UILabel().then { view in
    view.font = .systemFont(ofSize: 17.0)
    view.textColor = .gray900
    view.numberOfLines = 0
  }
  private let actionScrollView = UIScrollView().then { view in
    view.showsVerticalScrollIndicator = false
  }
  private let actionStackView = UPsStackView(axis: .vertical, spacing: 16.0, margin: UIEdgeInsets(all: 16.0))
  public let closeButton = UIButton().then { view in
    view.setTitleColor(.gray900, for: .normal)
    view.backgroundColor = .gray100
    view.setCornerRadius(8.0)
  }
  public var actionButtons = [UIButton]()
  
  private let contents: UPsAlertContentsProtocol
  
  
  
  // MARK: - Life Cycle
  
  public init(_ contents: UPsAlertContentsProtocol) {
    self.contents = contents
    super.init(frame: .zero)
    
    self.setAttribute()
    self.setConstraint()
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  
  
  // MARK: - Interface
  
  private var flexibleTargetCount: Int {
    self.contents.close == nil ? 5 : 4
  }
  
  private var flexibleActionHeight: CGFloat {
    self.contents.close == nil ? 376.0 : 296.0
  }
  
  
  
  // MARK: - UI
  
  private func setAttribute() {
    self.layer.cornerRadius = 16.0
    self.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
    self.layer.masksToBounds = true
    
    self.backgroundColor = .gray300
    
    if let close = self.contents.close {
      self.closeButton.setTitle(close, for: .normal)
      
      [self.contentsStackView, self.closeButton]
        .forEach(self.addSubview(_:))
      
    } else {
      [self.contentsStackView]
        .forEach(self.addSubview(_:))
    }
    
    if !(self.contents.title == nil && self.contents.meesage == nil) {
      self.contentsStackView.addArrangedSubview(self.infoStackView)
      
      if self.contents.title != nil {
        self.titleLabel.text = self.contents.title
        self.infoStackView.addArrangedSubview(self.titleLabel)
      }
      
      if self.contents.meesage != nil {
        self.subLabel.text = self.contents.meesage
        self.infoStackView.addArrangedSubview(self.subLabel)
      }
    }
    
    if self.contents.action.count > self.flexibleTargetCount {
      self.contentsStackView.addArrangedSubview(self.actionScrollView)
      self.actionScrollView.addSubview(self.actionStackView)
      
    } else {
      self.contentsStackView.addArrangedSubview(self.actionStackView)
    }
    
    self.contents.action
      .map { UPsAlertActionButton($0) }
      .forEach {
        self.actionButtons.append($0)
        self.actionStackView.addArrangedSubview($0)
      }
  }
  
  private func setConstraint() {
    self.contentsStackView.snp.makeConstraints { make in
      make.top.equalToSuperview().offset(8.0)
      make.leading.trailing.equalToSuperview()
    }
    
    if self.contents.action.count > self.flexibleTargetCount {
      self.actionScrollView.snp.makeConstraints { make in
        make.height.equalTo(self.flexibleActionHeight)
      }
      
      self.actionStackView.snp.makeConstraints { make in
        make.edges.width.equalToSuperview()
      }
    }
    
    if let _ = self.contents.close {
      self.closeButton.snp.makeConstraints { make in
        make.top.equalTo(self.contentsStackView.snp.bottom).offset(16.0)
        make.leading.trailing.equalToSuperview().inset(16.0)
        make.bottom.equalTo(self.safeAreaLayoutGuide).offset(-16.0)
        make.height.equalTo(52.0)
      }
      
    } else {
      self.contentsStackView.snp.makeConstraints { make in
        make.bottom.equalTo(self.safeAreaLayoutGuide).offset(-16.0)
      }
    }
  }
}
