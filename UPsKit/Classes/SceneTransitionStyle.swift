//
//  SceneTransitionStyle.swift
//  UPsKit
//
//  Created by UPs on 2022/09/10.
//

import Foundation

public enum SceneTransitionStyle {
  
  case root
  case push
  case modal(UIModalPresentationStyle)
}

public enum TransitionError: Error {
  
  case navigationControllerMissing
  case cannotPop
  case unknown
}
