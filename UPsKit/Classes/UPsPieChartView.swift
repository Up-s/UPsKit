//
//  UPsPieView.swift
//  UPsKit
//
//  Created by YouUp Lee on 2022/07/10.
//

import UIKit

public struct UPsSlice {
  
  public let title: String
  public let allTime: CGFloat
  public let interval: CGFloat
  public let color: UIColor
  
  public init(title: String, allTime: CGFloat, interval: CGFloat, color: UIColor) {
    self.title = title
    self.allTime = allTime
    self.interval = interval
    self.color = color
  }
  
  public var percent: CGFloat { self.interval / self.allTime }
}

public class UPsPieChartView: UIView {
  
  // MARK: - Property
  
  public let slices: [UPsSlice]
  public var sliceIndex: Int = 0
  public var duration: CGFloat = 1
  public var percent: CGFloat = 0
  public var labelFont: UIFont = .systemFont(ofSize: 16, weight: .bold)
  public var labelTextColor: UIColor = .black
  
  private var canvasSize: CGFloat {
    let width = self.bounds.size.width
    let height = self.bounds.size.height
    return width > height ? height : width
  }
  
  private var canvasCenter: CGPoint {
    let size = self.bounds.size
    return CGPoint(x: size.width / 2, y: size.height / 2)
  }
  
  private var percentage: String {
    let slice = self.slices[self.sliceIndex]
    return String(round(slice.percent * 1000) / 10)
  }
  
  
  
  // MARK: - Life Cycle
  
  public init(_ slices: [UPsSlice]) {
    self.slices = slices
    super.init(frame: .zero)
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  public override func draw(_ rect: CGRect) {
    self.createChart()
  }
  
  
  
  // MARK: - Interface
  
  public func createChart() {
    self.setInitialize()
    
    guard !self.slices.isEmpty else { return }
    let firstSlice = self.slices[0]
    self.addSlice(firstSlice)
    self.addLabel(firstSlice)
  }
  
  public func addSlice(_ slice: UPsSlice) {
    let animation = CABasicAnimation(keyPath: "strokeEnd")
    animation.fromValue = 0
    animation.toValue = 1
    animation.duration = self.getDuration(slice)
    animation.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.linear)
    animation.delegate = self
    
    let canvasWidth = self.canvasSize * 0.7
    let radius = canvasWidth * 3 / 7
    let path = UIBezierPath(
      arcCenter: self.canvasCenter,
      radius: radius,
      startAngle: self.percentToRadian(self.percent),
      endAngle: self.percentToRadian(self.percent + slice.percent),
      clockwise: true
    )
    
    let sliceLayer = CAShapeLayer()
    sliceLayer.path = path.cgPath
    sliceLayer.fillColor = nil
    sliceLayer.strokeColor = slice.color.cgColor
    sliceLayer.lineWidth = canvasWidth * 2 / 7
    sliceLayer.strokeEnd = 1
    sliceLayer.add(animation, forKey: animation.keyPath)
    
    self.layer.addSublayer(sliceLayer)
  }
  
  private func addLabel(_ slice: UPsSlice) {
    let labelCenter = getLabelCenter(slice)
    
    let label = UPsPaddingLabel(x: 8.0, y: 4.0)
    label.backgroundColor = .white
    label.font = self.labelFont
    label.numberOfLines = 0
    label.text = slice.title
    label.textAlignment = .center
    label.textColor = self.labelTextColor
    label.layer.cornerRadius = 4
    label.layer.masksToBounds = true
    label.layer.borderColor = slice.color.cgColor
    label.layer.borderWidth = 4.0
    self.addSubview(label)
    
    label.translatesAutoresizingMaskIntoConstraints = false
    NSLayoutConstraint.activate([
      label.centerXAnchor.constraint(equalTo: self.centerXAnchor, constant: labelCenter.x - self.canvasCenter.x),
      label.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: labelCenter.y - self.canvasCenter.y)
    ])
    
    self.layoutIfNeeded()
  }
  
  private func getLabelCenter(_ slice: UPsSlice) -> CGPoint {
    let radius = self.canvasSize * 2.6 / 7
    let labelAngle = self.percentToRadian(((self.percent + slice.percent) - self.percent) / 2 + self.percent)
    let path = UIBezierPath(
      arcCenter: self.canvasCenter,
      radius: radius,
      startAngle: labelAngle,
      endAngle: labelAngle,
      clockwise: true
    )
    path.close()
    return path.currentPoint
  }
  
  private func percentToRadian(_ percent: CGFloat) -> CGFloat {
    var angle = 270 + percent * 360
    if angle >= 360 {
      angle -= 360
    }
    return angle * CGFloat.pi / 180.0
  }
  
  private func getDuration(_ slice: UPsSlice) -> CFTimeInterval {
    return CFTimeInterval(slice.percent / 1.0 * duration)
  }
  
  private func setInitialize() {
    self.sliceIndex = 0
    self.percent = 0
    
    self.layer.sublayers = nil
    
    self.subviews
      .filter { $0 is UILabel }
      .forEach { $0.removeFromSuperview() }
  }
}



// MARK: - initialize

extension UPsPieChartView: CAAnimationDelegate {
  
  public func animationDidStop(_ anim: CAAnimation, finished flag: Bool) {
    guard flag else { return }
    self.percent += self.slices[self.sliceIndex].percent
    self.sliceIndex += 1
    
    guard self.sliceIndex < self.slices.count else { return }
    let nextSlice = self.slices[self.sliceIndex]
    self.addSlice(nextSlice)
    self.addLabel(nextSlice)
  }
}
