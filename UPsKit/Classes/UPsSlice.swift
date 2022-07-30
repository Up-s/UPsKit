//
//  UPsSlice.swift
//  UPsKit
//
//  Created by YouUp Lee on 2022/07/30.
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
  
  public var percentAll: CGFloat { self.interval / self.allTime }
  public func percentTop(top: CGFloat) -> CGFloat {
    self.interval / top
  }
}
