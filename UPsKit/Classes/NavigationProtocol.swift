//
//  NavigationProtocol.swift
//  UPsKit
//
//  Created by UPs on 2022/09/10.
//

import UIKit

import SnapKit

public protocol NavigationProtocol {
  
  var naviView: BaseNavigationView { get }
}

public extension NavigationProtocol where Self: UIView {
  
  func setNavigation() {
    let safeBackgroundView = UIView()
    safeBackgroundView.backgroundColor = self.naviView.backgroundColor
    
    [safeBackgroundView, self.naviView]
      .forEach(self.addSubview(_:))
    
    let guide = self.safeAreaLayoutGuide
    
    safeBackgroundView.snp.makeConstraints { make in
      make.top.equalToSuperview()
      make.leading.trailing.equalTo(guide)
      make.bottom.equalTo(self.naviView.snp.top)
    }
    
    self.naviView.snp.makeConstraints { make in
      make.top.leading.trailing.equalTo(guide)
    }
  }
}
