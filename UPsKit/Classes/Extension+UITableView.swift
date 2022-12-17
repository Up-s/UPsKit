//
//  Extension+UITableView.swift
//  UPsKit
//
//  Created by UPs on 2022/09/10.
//

import UIKit

public extension UITableView {
  
  func register<T: UITableViewCell>(cellType: T.Type) where T: CellIdentifiable {
    register(cellType.self, forCellReuseIdentifier: cellType.identifier)
  }
  
  func registerHeaderFooter<T: UITableViewHeaderFooterView>(viewType: T.Type) where T: CellIdentifiable {
    register(viewType.self, forHeaderFooterViewReuseIdentifier: viewType.identifier)
  }
  
  func dequeueReusableCell<T: UITableViewCell>(withCellType type: T.Type = T.self) -> T where T: CellIdentifiable {
    guard let cell = dequeueReusableCell(withIdentifier: type.identifier) as? T
    else { fatalError("Couldn't dequeue a UITableViewCell with identifier: \(type.identifier)") }
    return cell
  }
  
  func dequeueResuableCell<T: UITableViewCell>(withCellType type: T.Type = T.self, forIndexPath indexPath: IndexPath) -> T where T: CellIdentifiable {
    guard let cell = dequeueReusableCell(withIdentifier: type.identifier, for: indexPath) as? T
    else { fatalError("Couldn't dequeue a UITableViewCell with identifier: \(type.identifier)") }
    return cell
  }
  
  func dequeueResuableHeaderFooterView<T: UITableViewHeaderFooterView>(withViewType type: T.Type) -> T where T: CellIdentifiable {
    guard let headerFooterView = self.dequeueReusableHeaderFooterView(withIdentifier: type.identifier) as? T
    else { fatalError("Couldn't dequeue a UITableViewHeaderFooterView with identifier: \(type.identifier)") }
    return headerFooterView
  }
}
