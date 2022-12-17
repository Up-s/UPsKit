//
//  UPsPieView.swift
//  UPsKit
//
//  Created by YouUp Lee on 2022/07/10.
//

import UIKit

public class UPsPieChartView: UIView {
  
  // MARK: - Property
  
  private var slices: [UPsSlice] = []
  private var sliceIndex: Int = 0
  private var percent: CGFloat = 0
  private var labels: [UILabel] = []
  
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
    return String(round(slice.percentAll * 1000) / 10)
  }
  
  
  
  // MARK: - Life Cycle
  
  public init() {
    super.init(frame: .zero)
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  
  
  // MARK: - Interface
  
  public func drawChart(_ slices: [UPsSlice]) {
    self.resetContent()
    self.slices = slices
    
    DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) { [weak self] in
      guard let self = self, !self.slices.isEmpty else { return }
      let firstSlice = self.slices[0]
      self.addSlice(firstSlice)
      self.addLabel(firstSlice)
    }
  }
  
  private func resetContent() {
    self.sliceIndex = 0
    self.percent = 0
    self.labels
      .forEach { $0.removeFromSuperview() }
    self.layer.sublayers = nil
  }
  
  private func addSlice(_ slice: UPsSlice) {
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
      endAngle: self.percentToRadian(self.percent + slice.percentAll),
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
    label.font = .systemFont(ofSize: 16, weight: .bold)
    label.numberOfLines = 0
    label.text = slice.title
    label.textAlignment = .center
    label.textColor = .black
    label.layer.cornerRadius = 4
    label.layer.masksToBounds = true
    label.layer.borderColor = slice.color.cgColor
    label.layer.borderWidth = 2.0
    self.labels.append(label)
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
    let labelAngle = self.percentToRadian(((self.percent + slice.percentAll) - self.percent) / 2 + self.percent)
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
    return CFTimeInterval(slice.percentAll / 1.0 * 1)
  }
}



// MARK: - initialize

extension UPsPieChartView: CAAnimationDelegate {
  
  public func animationDidStop(_ anim: CAAnimation, finished flag: Bool) {
    guard flag else { return }
    self.percent += self.slices[self.sliceIndex].percentAll
    self.sliceIndex += 1
    
    guard self.sliceIndex < self.slices.count else { return }
    let nextSlice = self.slices[self.sliceIndex]
    self.addSlice(nextSlice)
    self.addLabel(nextSlice)
  }
}
