//
//  UPsAlertBaseView.swift
//  UPsKit
//
//  Created by YouUp Lee on 2023/07/30.
//

import UIKit

import SnapKit

public class UPsAlertBaseView: UIView {
  
  // MARK: - Property
  
  private var effectView: UIVisualEffectView?
  private let backgroundButton = UIButton()
  private let alertView: UPsAlertView
  
  
  
  // MARK: - Life Cycle
  
  public init(_ contents: UPsAlertContents) {
    self.alertView = UPsAlertView(contents)
    super.init(frame: .zero)
    
    self.setAttribute()
    self.setConstraint()
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  
  private var isLayoutSubviews = true
  public override func layoutSubviews() {
    super.layoutSubviews()
    
    if self.isLayoutSubviews {
      self.isLayoutSubviews = false
      self.setBlurView()
      self.setBackButton()
      self.setAlertView()
    }
  }
  
  
  
  // MARK: - Interface
  
  private func setBlurView() {
    let blurEffect = UIBlurEffect(style: .regular)
    let visualEffectView = UIVisualEffectView(effect: blurEffect)
    visualEffectView.alpha = 0.0
    visualEffectView.frame = self.frame
    self.addSubview(visualEffectView)
    self.effectView = visualEffectView
    
    UIView.animate(withDuration: 0.5) { [weak self] in
      visualEffectView.alpha = 1.0
      self?.layoutIfNeeded()
    }
  }
  
  private func setBackButton() {
    self.addSubview(self.backgroundButton)
    self.backgroundButton.snp.makeConstraints { make in
      make.edges.equalToSuperview()
    }
  }
  
  private func setAlertView() {
    self.addSubview(self.alertView)
    self.alertView.snp.makeConstraints { make in
      make.top.equalTo(self.snp.bottom)
      make.leading.trailing.equalToSuperview()
    }
    
    DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
      UIView.animate(withDuration: 0.2) { [weak self] in
        guard let self else { return }
        let height = self.alertView.bounds.height
        self.alertView.snp.updateConstraints { make in
          make.top.equalTo(self.snp.bottom).offset(-height)
        }
        self.layoutIfNeeded()
      }
    }
  }
  
  @objc private func closeDidTap(_ sender: UIButton) {
    UIView.animate(
      withDuration: 0.2,
      animations: { [weak self] in
        guard let self else { return }
        self.effectView?.alpha = 0.0
        
        self.alertView.snp.updateConstraints { make in
          make.top.equalTo(self.snp.bottom)
        }
        
        self.layoutIfNeeded()
      },
      completion: { [weak self] _ in
        self?.removeFromSuperview()
      }
    )
  }
  
  
  
  // MARK: - UI
  
  private func setAttribute() {
    var buttons = [self.backgroundButton, self.alertView.closeButton]
    buttons.append(contentsOf: self.alertView.actionButtons)
    buttons.forEach {
      $0.addTarget(self, action: #selector(self.closeDidTap(_:)), for: .touchUpInside)
    }
  }
  
  private func setConstraint() {
   
  }
}
