//
//  Extension+UIViewController.swift
//  UPsKit
//
//  Created by YouUp Lee on 2022/06/06.
//

import UIKit

public extension UIViewController {
  
  // MARK: - ScenCondinator
  
  var sceneViewController: UIViewController {
    return self.children.last ?? self
  }
  
  
  
  // MARK: - Toast
  
  func toast(_ title: String) {
    let tempToastLabel = UPsPaddingLabel(x: 24, y: 16)
    tempToastLabel.text = title
    tempToastLabel.font = .boldSystemFont(ofSize: 16)
    tempToastLabel.alpha = 0
    tempToastLabel.numberOfLines = 0
    tempToastLabel.textAlignment = .center
    tempToastLabel.textColor = .white
    tempToastLabel.backgroundColor = UIColor.black.withAlphaComponent(0.9)
    tempToastLabel.layer.cornerRadius = 4
    tempToastLabel.layer.masksToBounds = true
    self.view.addSubview(tempToastLabel)
    
    let guide = self.view.safeAreaLayoutGuide
    tempToastLabel.translatesAutoresizingMaskIntoConstraints = false
    tempToastLabel.centerXAnchor.constraint(equalTo: guide.centerXAnchor).isActive = true
    tempToastLabel.widthAnchor.constraint(lessThanOrEqualTo: guide.widthAnchor, multiplier: 1, constant: -48).isActive = true
    let topConstraint = tempToastLabel.topAnchor.constraint(equalTo: guide.topAnchor, constant: 4)
    topConstraint.isActive = true
    
    let duration: Double = 0.5
    let delay: Double = 3.5
    DispatchQueue.main.asyncAfter(wallDeadline: .now() + 0.1) { [weak self] in
      UIView.animate(withDuration: duration) {
        topConstraint.constant += 12
        tempToastLabel.alpha = 1.0
        self?.view.layoutIfNeeded()
      }
    }
    
    DispatchQueue.main.asyncAfter(wallDeadline: .now() + Double(duration + delay)) { [weak self] in
      UIView.animate(withDuration: duration, animations: {
        topConstraint.constant -= 12
        tempToastLabel.alpha = 0.0
        self?.view.layoutIfNeeded()
      }) { _ in
        tempToastLabel.removeFromSuperview()
      }
    }
  }
  
  
  
  // MARK: - AlertController
  
  func alert(title: String? = nil, message: String? = nil, style: UIAlertController.Style = .alert, actions: [UPsAlertActionProtocol], completion: (() -> Void)? = nil) {
    let alert = UIAlertController(title: title, message: message, preferredStyle: style)
    for action in actions {
      let tempAction = UIAlertAction(title: action.title, style: action.style, handler: action.handler)
      alert.addAction(tempAction)
      
    }
    self.present(alert, animated: true, completion: completion)
  }
  
  func alertTextField(title: String? = nil, message: String? = nil, keyboardType: UIKeyboardType = .default, placeholder: String? = nil, actionTitle: String, cancel: String, handler: ((String?) -> Void)? = nil, completion: (() -> Void)? = nil) {
    let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
    alert.addTextField {
      $0.keyboardType = keyboardType
      $0.placeholder = placeholder
    }
    
    let action = UIAlertAction(title: actionTitle, style: .default) { _ in
      let text = alert.textFields?[0].text
      handler?(text)
    }
    alert.addAction(action)
    
    let cancel = UIAlertAction(title: cancel, style: .cancel)
    alert.addAction(cancel)
    
    self.present(alert, animated: true, completion: completion)
  }
  
  
  
  // MARK: - IndicatoerViewController
  
  func presentIndicatorViewController() {
    let vcIndicator = UPsIndicatorViewController()
    vcIndicator.modalPresentationStyle = .overFullScreen
    self.present(vcIndicator, animated: false)
  }
  
  func dismissIndicatorViewController() {
    guard let vcIndicator = self.presentedViewController as? UPsIndicatorViewController else { return }
    vcIndicator.dismiss(animated: false)
  }
  
  
  
  // MARK: - NavigationController
  
  func addBackBarButton(_ selector: Selector? = nil) {
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
  
  func addDismissBarButton(_ selector: Selector? = nil) {
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
