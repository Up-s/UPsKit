//
//  UPsBarChartView.swift
//  UPsKit
//
//  Created by YouUp Lee on 2022/07/30.
//

import UIKit

public class UPsBarChartView: UIView {
  
  // MARK: - Property
  
  private var slices: [UPsSlice] = []
  
  private let contentStackView = UPsStackView(axis: .vertical, spacing: 24.0)
  private var unitStackViews = [UPsStackView]()
  private var barBaseViews = [UIView]()
  private var barWidths = [NSLayoutConstraint]()
  
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
      self.addContent()
      self.startAnimation()
    }
  }
  
  private func resetContent() {
    self.barBaseViews.forEach {
      $0.subviews.forEach {
        $0.removeFromSuperview()
      }
    }
    
    self.unitStackViews.forEach {
      $0.subviews.forEach {
        $0.gestureRecognizers?.removeAll()
        $0.removeFromSuperview()
      }
    }
    
    self.contentStackView.subviews.forEach {
      $0.removeFromSuperview()
    }
    
    self.unitStackViews.removeAll()
    self.barBaseViews.removeAll()
    self.barWidths.removeAll()
  }
  
  private func addContent() {
    for (index, slice) in self.slices.enumerated() {
      let unitStackView = UPsStackView(axis: .horizontal, spacing: 16.0)
      unitStackView.tag = index
      unitStackView.backgroundColor = .gray200
      unitStackView.layer.cornerRadius = 8.0
      unitStackView.translatesAutoresizingMaskIntoConstraints = false
      
      let tap = UITapGestureRecognizer()
      tap.numberOfTapsRequired = 1
      tap.addTarget(self, action: #selector(self.sliceDidTap(_:)))
      unitStackView.addGestureRecognizer(tap)
      self.unitStackViews.append(unitStackView)
      
      let tagLabel = UILabel()
      tagLabel.text = slice.title
      tagLabel.textColor = .gray900
      tagLabel.adjustsFontSizeToFitWidth = true
      tagLabel.font = .systemFont(ofSize: 18, weight: .semibold)
      tagLabel.textAlignment = .right
      tagLabel.translatesAutoresizingMaskIntoConstraints = false
      unitStackView.addArrangedSubview(tagLabel)
      let isPhone: Bool = UIDevice.current.userInterfaceIdiom == .phone
      let multi: CGFloat = isPhone ? 0.3 : 0.22
      NSLayoutConstraint.activate([
        tagLabel.widthAnchor.constraint(equalTo: unitStackView.widthAnchor, multiplier: multi)
      ])
      
      let barBaseView = UIView()
      unitStackView.addArrangedSubview(barBaseView)
      self.barBaseViews.append(barBaseView)
      
      let barView = UIView()
      barView.backgroundColor = slice.color
      barView.layer.cornerRadius = 4.0
      barView.layer.masksToBounds = true
      barView.translatesAutoresizingMaskIntoConstraints = false
      barBaseView.addSubview(barView)
      NSLayoutConstraint.activate([
        barView.centerYAnchor.constraint(equalTo: barBaseView.centerYAnchor),
        barView.leadingAnchor.constraint(equalTo: barBaseView.leadingAnchor),
        barView.heightAnchor.constraint(equalToConstant: 8.0)
      ])
      let barWidth = barView.widthAnchor.constraint(equalToConstant: 0.0)
      barWidth.isActive = true
      self.barWidths.append(barWidth)
      
      let timeLabel = UILabel()
      let itme = Int(slice.interval).toTimer(.HM) + "h"
      timeLabel.text = itme
      timeLabel.textColor = slice.color
      timeLabel.font = .systemFont(ofSize: 16, weight: .regular)
      timeLabel.translatesAutoresizingMaskIntoConstraints = false
      barBaseView.addSubview(timeLabel)
      NSLayoutConstraint.activate([
        timeLabel.centerYAnchor.constraint(equalTo: barBaseView.centerYAnchor),
        timeLabel.leadingAnchor.constraint(equalTo: barView.trailingAnchor, constant: 8.0)
      ])
      
      self.contentStackView.addArrangedSubview(unitStackView)
      NSLayoutConstraint.activate([
        unitStackView.heightAnchor.constraint(equalToConstant: 40.0)
      ])
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
      let delay: Double = 0.08 * Double(index)
      
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
      
      let barWidth = self.barWidths[index]
      UIView.animate(
        withDuration: duration,
        delay: delay,
        options: [.curveEaseInOut],
        animations: { [weak self] in
          barWidth.constant = width
          self?.layoutIfNeeded()
        })
    }
  }
  
  @objc private func sliceDidTap(_ sender: UITapGestureRecognizer) {
    self.barDidTap?(sender.view?.tag)
  }
  
  private func setConstraint() {
    self.contentStackView.translatesAutoresizingMaskIntoConstraints = false
    self.addSubview(self.contentStackView)
    NSLayoutConstraint.activate([
      self.contentStackView.topAnchor.constraint(equalTo: self.topAnchor, constant: 24.0),
      self.contentStackView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 24.0),
      self.contentStackView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -24.0),
      self.contentStackView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -24.0)
    ])
  }
}
