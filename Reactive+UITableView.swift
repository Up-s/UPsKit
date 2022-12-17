//
//  Reactive+UITableView.swift
//  UPsKit
//
//  Created by UPs on 2022/12/17.
//

import RxSwift

public extension Reactive where Base: UITableView {
  
  var reload: Binder<Void> {
    return Binder(self.base) { tableView, _ in
      tableView.reloadData()
    }
  }
}
