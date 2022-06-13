//
//  Snippets.swift
//  UPsKit
//
//  Created by Lee on 2022/06/13.
//


/*
 
import UIKit

final class <#View#>: BaseView {
  
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

final class <#ViewController#>: BaseViewController {
  
  // MARK: - Property
  
  private let <#View#> = <#View#>()
  private let <#ViewModel#> = <#ViewModel#>()
  
  
  
  // MARK: - Life Cycle
  
  override func loadView() {
    self.view = <#View#>
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    self.setAttribute()
    self.setBind()
  }
  
  
  
  // MARK: - Interface
  
  private func setAttribute() {
    
  }
  
  private func setBind() {
    
  }
}
 
*/





/*

import RxCocoa
import RxSwift

final class <#ViewModel#>: BaseViewModel {
  
  struct Input {
  }
  
  struct Output {
  }
  
  
  
  // MARK: - Property
  
  let input = Input()
  let output = Output()
  let bag = DisposeBag()
  
  
  
  // MARK: - Interface
  
  override init() {
    super.init()
    
  }
}

*/





/*
 
 // MARK: -
 
*/





/*
 
@objc private func <#name#>() {
  
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

final class Singleton {
  static let shared = Singleton()
  private init () {}
  
}

*/





/*
 
print("\n---------------------- [ \(<#code#>) ] ----------------------")

*/





/*

print(" <#class#> | \(#function), \(code), \(msg)")
 
*/





/*

print("\n---------------------- [ \(#function) ] ----------------------")
 
*/





/*

import UIKit

final class <#TableViewCell#>: UITableViewCell {
  
  static let identifier = "<#TableViewCell#>"
  
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
  
  func setValue(_ data: Any) {
    
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

final class <#CollectionViewCell#>: UICollectionViewCell {
    
  static let identifier = "<#CollectionViewCell#>"
  
  // MARK: - Property
  
  
  
  // MARK: - Life Cycle
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    
    setAttribute()
    setConstraint()
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  
  
  // MARK: - Interface
  
  func setValue(_ data: Any) {
    
  }
  


  // MARK: - UI

  private func setAttribute() {
    
  }
  
  private func setConstraint() {
    
  }
}

*/
