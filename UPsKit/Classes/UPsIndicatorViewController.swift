//
//  UPsIndicatorViewController.swift
//  UPsKit
//
//  Created by Lee on 2022/05/26.
//

import UIKit

import SnapKit

final class UPsIndicatorViewController: UIViewController {
  
  // MARK: - Property
  
  private let indicatorView = UIActivityIndicatorView()
  
  
  
  // MARK: - Life Cycle
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    self.setAttribute()
    self.setConstraint()
  }



  // MARK: - UI

  private func setAttribute() {
    self.view.backgroundColor = UIColor.black.withAlphaComponent(0.6)
    
    self.indicatorView.startAnimating()
    self.indicatorView.style = UIActivityIndicatorView.Style.large
    self.indicatorView.color = .white
    self.view.addSubview(self.indicatorView)
  }
  
  private func setConstraint() {
    let guide = self.view.safeAreaLayoutGuide
    
    self.indicatorView.snp.makeConstraints { make in
      make.center.equalTo(guide)
    }
    
  }
}
