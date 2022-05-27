//
//  UPsBaseViewContronller.swift
//  UPsKit
//
//  Created by Lee on 2022/05/26.
//

import UIKit

open class UPsBaseViewController: UIViewController {
  
  
  
  
  
  // MARK: - AlertController
  
  public struct AlertAction {
    let title: String
    let style: UIAlertAction.Style
    let handler: ((UIAlertAction) -> Void)?
  }
  
  public func alertBase(title: String? = nil, message: String? = nil, style: UIAlertController.Style = .alert, actions: [AlertAction]) {
    let alert = UIAlertController(title: title, message: message, preferredStyle: style)
    for action in actions {
      let tempAction = UIAlertAction(title: action.title, style: action.style, handler: action.handler)
      alert.addAction(tempAction)
    }
    let cancel = UIAlertAction(title: "닫기", style: .cancel)
    alert.addAction(cancel)
    self.present(alert, animated: true)
  }
  
  public func alertCancel(title: String? = nil, message: String? = nil, handler: ((UIAlertAction) -> Void)? = nil) {
    let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
    let cancel = UIAlertAction(title: "닫기", style: .cancel, handler: handler)
    alert.addAction(cancel)
    self.present(alert, animated: true)
  }
  
  public func alertTextField(title: String? = nil, message: String? = nil, style: UIAlertController.Style = .alert, keyboardType: UIKeyboardType = .default, placeholder: String? = nil, actionTitle: String, handler: @escaping (String?) -> Void) {
    let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
    alert.addTextField {
      $0.keyboardType = keyboardType
      $0.placeholder = placeholder
    }
    
    let action = UIAlertAction(title: actionTitle, style: .default) { (_) in
      let text = alert.textFields?[0].text
      handler(text)
    }
    let cancel = UIAlertAction(title: "닫기", style: .cancel)
    
    alert.addAction(action)
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
  
  public func addBackBarButton() {
    self.navigationController?.interactivePopGestureRecognizer?.delegate = nil
    let backImage = UIImage.sf(name: "chevron.left", color: .black)
    let backBarButton = UIBarButtonItem(image: backImage,
                                        style: .done,
                                        target: self,
                                        action: #selector(self.backAction(_:)))
    self.navigationItem.leftBarButtonItem = backBarButton
  }
  
  @objc private func backAction(_ sender: UIBarButtonItem) {
    self.navigationController?.popViewController(animated: true)
  }
  
  public func addDismissBarButton() {
    let dismissIamge = UIImage.sf(name: "chevron.down", color: .black)
    let dismissBarButton = UIBarButtonItem(image: dismissIamge,
                                           style: .done,
                                           target: self,
                                           action: #selector(self.dismissAction(_:)))
    self.navigationItem.leftBarButtonItem = dismissBarButton
  }
  
  @objc private func dismissAction(_ sender: UIBarButtonItem) {
    self.dismiss(animated: true)
  }
  
}
