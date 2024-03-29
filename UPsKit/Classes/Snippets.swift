//
//  Snippets.swift
//  UPsKit
//
//  Created by Lee on 2022/06/13.
//


/*
 
import UIKit

import SnapKit
import Then
import UPsKit

final class <#Nanem#>View: BaseView {
  
  // MARK: - Property
  
  
  
  
  // MARK: - Life Cycle
  
  override init() {
    super.init()
    
    self.setAttribute()
    self.setConstraint()
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  
  
  // MARK: - Interface
  
  
  
  // MARK: - UI

  private func setAttribute() {
    
  }
  
  private func setConstraint() {
    let guide = self.safeAreaLayoutGuide
    
  }
}

*/





/*
 
import UIKit

import RxCocoa
import RxSwift
import UPsKit

final class <#Name#>ViewController: BaseViewController {
  
  // MARK: - Property
  
  private let rootView = <#Name#>View()
  private let viewModel: <#Name#>ViewModel
  
  
  
  // MARK: - Life Cycle
 
  init(_ viewModel: <#Name#>ViewModel) {
    self.viewModel = viewModel
    super.init()
  }
 
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
 
  override func loadView() {
    self.view = self.rootView
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    self.configure()
    self.bindViewModel()
  }
  
  
  
  // MARK: - Interface
  
  private func configure() {
    
  }
  
  private func bindViewModel() {
    
  }
}
 
*/





/*


import RxCocoa
import RxSwift
import UPsKit

final class <#Name#>ViewModel: BaseViewModel {
  
  struct Input {
  }
  
  struct Output {
  }
  
  
  
  // MARK: - Property
  
  let input = Input()
  let output = Output()
  
  
  
  // MARK: - Interface
  
  init() {
    super.init()
    
  }
}

*/





/*

import UIKit

import SnapKit
import Then
import UPsKit

final class <#Name#>TableViewCell: UITableViewCell, CellIdentifiable {

  // MARK: - Property
  
  
  
  // MARK: - Life Cycle
  
  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    
    self.setAttribute()
    self.setConstraint()
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  
  
  // MARK: - Interface
  
  func setData(_ data: Any) {
    
  }
  
  
  
  // MARK: - UI

  private func setAttribute() {
    self.selectionStyle = .none
    self.backgroundColor = .clear
    
  }
  
  private func setConstraint() {
    
  }
}
 
*/





/*

import UIKit

import SnapKit
import Then
import UPsKit

final class <#Name#>CollectionViewCell: UICollectionViewCell, CellIdentifiable {
  
  // MARK: - Property
  
  
  
  // MARK: - Life Cycle
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    
    self.setAttribute()
    self.setConstraint()
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  
  
  // MARK: - Interface
  
  func setData(_ data: Any) {
    
  }
  


  // MARK: - UI

  private func setAttribute() {
    
  }
  
  private func setConstraint() {
    
  }
}

*/





/*

import CodableFirebase
import Firebase
import RxCocoa
import RxSwift

final class <#Name#>Provider {
   
  class func <#name#>() -> Observable<<#Type#>> {
    Observable<<#Type#>>.create { observer -> Disposable in
       
      Firestore
        .firestore()
       
      return Disposables.create()
    }
  }
}

*/





/*
 
import Firebase

final class <#Name#>Provider {
  
  class func <#function#>(completion: @escaping (Result<String, Error>) -> Void) {
    Firestore.firestore()
  }
}

*/





/*
 
// MARK: -
 
*/





/*
 
@objc private func <#name#>(_ sender: UIButton) {
  
}

*/





/*

final class Singleton {
 
  static let shared = Singleton()
  private init () {}
  
}

*/





/*

self.debugLog(#function, #line, error)
 
*/





/*

print("\n---------------------- [ \(#function) ] ----------------------")
 
*/





/*

print("\n-----------------------------------")

*/
