//
//  Extension+UIViewController.swift
//  UPsKit
//
//  Created by YouUp Lee on 2022/06/06.
//

import UIKit

extension UIViewController {
  
  // MARK: - AlertController
  
  public func alertBase(_ model: UPsAlertBaseModel) {
    let alert = UIAlertController(title: model.title, message: model.message, preferredStyle: model.style)
    for action in model.actions {
      let tempAction = UIAlertAction(title: action.title, style: action.style, handler: action.handler)
      alert.addAction(tempAction)
    }
    self.present(alert, animated: true)
  }
  
  public func alertTextField(_ model: UPsAlertTextFieldModel) {
    let alert = UIAlertController(title: model.title, message: model.message, preferredStyle: .alert)
    alert.addTextField {
      $0.keyboardType = model.keyboardType
      $0.placeholder = model.placeholder
    }
    
    let action = UIAlertAction(title: model.actionTitle, style: .default) { _ in
      let text = alert.textFields?[0].text
      model.handler?(text)
    }
    alert.addAction(action)
    
    let cancel = UIAlertAction(title: "닫기", style: .cancel)
    alert.addAction(cancel)
    
    self.present(alert, animated: true)
  }
  
  
  
  // MARK: - IndicatoerViewController
  
  public func presentIndicatorViewController() {
    let vcIndicator = UPsIndicatorViewController()
    vcIndicator.modalPresentationStyle = .overFullScreen
    self.present(vcIndicator, animated: false)
  }
  
  public func dismissIndicatorViewController() {
    guard let vcIndicator = self.presentedViewController as? UPsIndicatorViewController else { return }
    vcIndicator.dismiss(animated: false)
  }
  
  
  
  // MARK: - NavigationController
  
  public func addBackBarButton(_ selector: Selector? = nil) {
    self.navigationController?.interactivePopGestureRecognizer?.delegate = nil
    let backImage = UIImage.sf(name: "chevron.left", color: .black)
    let action: Selector = selector ?? #selector(self.backAction(_:))
    let backBarButton = UIBarButtonItem(image: backImage,
                                        style: .done,
                                        target: self,
                                        action: action)
    self.navigationItem.leftBarButtonItem = backBarButton
  }
  
  @objc private func backAction(_ sender: UIBarButtonItem) {
    self.navigationController?.popViewController(animated: true)
  }
  
  public func addDismissBarButton(_ selector: Selector? = nil) {
    let dismissIamge = UIImage.sf(name: "chevron.down", color: .black)
    let action: Selector = selector ?? #selector(self.dismissAction(_:))
    let dismissBarButton = UIBarButtonItem(image: dismissIamge,
                                           style: .done,
                                           target: self,
                                           action: action)
    self.navigationItem.leftBarButtonItem = dismissBarButton
  }
  
  @objc private func dismissAction(_ sender: UIBarButtonItem) {
    self.dismiss(animated: true)
  }
  
  
}
