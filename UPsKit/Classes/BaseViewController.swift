//
//  BaseViewController.swift
//  UPsKit
//
//  Created by UPs on 2022/09/09.
//

import UIKit

import RxCocoa
import RxSwift

public class BaseViewController: UIViewController {
  
  public let disposeBag = DisposeBag()
  
  
  
  deinit {
      print("🎉🎉🎉 deinit: \(self.className) 🎉🎉🎉")
  }
}
