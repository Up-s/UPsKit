//
//  UPsBarChartView.swift
//  UPsKit
//
//  Created by YouUp Lee on 2022/07/30.
//

import UIKit

public class UPsBarChartView: UIView {
  
  // MARK: - Property
  
  private let contentStackView = UPsStackView(axis: .vertical, spacing: 24.0)
  
  public var slices: [UPsSlice] = []
  public var boardStackViews = [UPsStackView]()
  public var tagLabels = [UILabel]()
  public var barBaseViews = [UIView]()
  public var barViews = [UIView]()
  public var timeLabels = [UILabel]()
  public var labelFont: UIFont = .systemFont(ofSize: 18, weight: .semibold)
  public var labelTextColor: UIColor = .black
  
  public var barDidTap: ((Int?) -> Void)?
  
  
  
  // MARK: - Life Cycle
  
  public init() {
    super.init(frame: .zero)
    self.setConstraint()
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  
  
  // MARK: - Interface
  
  public func drawChart(_ slices: [UPsSlice]) {
    self.resetContent()
    self.slices = slices
    
    DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
      [weak self] in
      guard let self = self, !self.slices.isEmpty else { return }
      self.addLabel()
      self.startAnimation()
    }
  }
  
  private func resetContent() {
    self.barBaseViews.forEach {
      $0.subviews.forEach {
        $0.removeFromSuperview()
      }
    }
    
    self.boardStackViews.forEach {
      $0.subviews.forEach {
        $0.gestureRecognizers?.removeAll()
        $0.removeFromSuperview()
      }
    }
    
    self.contentStackView.subviews.forEach {
      $0.removeFromSuperview()
    }
    
    self.boardStackViews.removeAll()
    self.tagLabels.removeAll()
    self.barViews.removeAll()
    self.barViews.removeAll()
    self.timeLabels.removeAll()
  }
  
  private func addLabel() {
    for (index, slice) in self.slices.enumerated() {
      let boardStackView = UPsStackView(axis: .horizontal, spacing: 16.0)
      boardStackView.tag = index
      boardStackView.backgroundColor = .boardGray
      boardStackView.layer.cornerRadius = 8.0
      
      let tap = UITapGestureRecognizer()
      tap.numberOfTapsRequired = 1
      tap.addTarget(self, action: #selector(self.sliceDidTap(_:)))
      boardStackView.addGestureRecognizer(tap)
      self.boardStackViews.append(boardStackView)
      
      let tagLabel = UILabel()
      tagLabel.text = "  " + slice.title
      tagLabel.textColor = self.labelTextColor
      tagLabel.adjustsFontSizeToFitWidth = true
      tagLabel.font = self.labelFont
      tagLabel.textAlignment = .right
      self.tagLabels.append(tagLabel)
      boardStackView.addArrangedSubview(tagLabel)
      let multi: CGFloat = AppManager.isPhone ? 0.34 : 0.22
      tagLabel.snp.makeConstraints { make in
        make.width.equalToSuperview().multipliedBy(multi)
      }
      
      let barBaseView = UIView()
      boardStackView.addArrangedSubview(barBaseView)
      self.barBaseViews.append(barBaseView)
      
      let barView = UIView()
      barView.backgroundColor = slice.color
      barView.layer.cornerRadius = 4.0
      barView.layer.masksToBounds = true
      barBaseView.addSubview(barView)
      self.barViews.append(barView)
      barView.snp.makeConstraints { make in
        make.centerY.equalToSuperview()
        make.leading.equalToSuperview()
        make.width.equalTo(0.0)
        make.height.equalTo(8.0)
      }
      
      let timeLabel = UILabel()
      let itme = Int(slice.interval).toTimer(.HM) + "h"
      timeLabel.text = itme
      timeLabel.textColor = slice.color
      timeLabel.font = .systemFont(ofSize: 16, weight: .regular)
      barBaseView.addSubview(timeLabel)
      self.timeLabels.append(timeLabel)
      timeLabel.snp.makeConstraints { make in
        make.centerY.equalToSuperview()
        make.leading.equalTo(barView.snp.trailing).offset(8.0)
      }
      
      self.contentStackView.addArrangedSubview(boardStackView)
      boardStackView.snp.makeConstraints { make in
        make.height.equalTo(40.0)
      }
      self.layoutIfNeeded()
    }
  }
  
  private func startAnimation() {
    for (index, slice) in self.slices.enumerated() {
      let barBaseView = self.barBaseViews[index]
//      let lineWidth: CGFloat = 8.0
//      let linePointY: CGFloat = (barView.bounds.height / 2)
      let width = slice.percentTop(top: self.slices[0].interval) * barBaseView.bounds.width * 0.6
      
      let duration: Double = 2
      let delay: Double = 0.05 * Double(index)
      
//      let barPath = UIBezierPath()
//      barPath.move(to: CGPoint(x: 0, y: linePointY))
//      barPath.addLine(to: CGPoint(x: width, y: linePointY))
//
//      let barLayer = CAShapeLayer()
//      barLayer.frame = barView.bounds
//      barLayer.path = barPath.cgPath
//      barLayer.strokeColor = slice.color.cgColor
//      barLayer.lineWidth = lineWidth
//      barLayer.lineCap = .round
////      barLayer.duration = duration
//      barLayer.beginTime = delay
//      barView.layer.addSublayer(barLayer)
//
//      let barAnimation = CABasicAnimation(keyPath: "strokeEnd")
//      barAnimation.fromValue = 0
//      barAnimation.toValue = 1
//      barAnimation.duration = duration
////      barAnimation.beginTime = delay
//      barLayer.add(barAnimation, forKey: "lineAnimation")
      
      let barView = self.barViews[index]
      UIView.animate(
        withDuration: duration,
        delay: delay,
        options: [.curveEaseInOut],
        animations: { [weak self] in
          barView.snp.updateConstraints { make in
            make.width.equalTo(width)
          }
          self?.layoutIfNeeded()
        })
    }
  }
  
  @objc private func sliceDidTap(_ sender: UITapGestureRecognizer) {
    self.barDidTap?(sender.view?.tag)
  }
  
  private func setConstraint() {
    self.addSubview(self.contentStackView)
    
    self.contentStackView.snp.makeConstraints { make in
      make.edges.equalToSuperview().inset(24.0)
    }
  }
}
