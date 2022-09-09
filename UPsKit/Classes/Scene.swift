//
//  Scene.swift
//  UPsKit
//
//  Created by UPs on 2022/09/10.
//

import Foundation
import UIKit

public enum Scene {
  
  case alert
  
}



public extension Scene {
  
  var viewController: UIViewController {
    switch self {
    case .alert:
      return UIViewController()
    }
  }
}
