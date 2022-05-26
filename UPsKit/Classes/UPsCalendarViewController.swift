//
//  UPsCalendarViewController.swift
//  UPsKit
//
//  Created by Lee on 2022/05/27.
//

import UIKit
import FSCalendar

open class UPsCalendarViewController: UPsBaseViewController {
  
  public var selectDate = Date()
  private var calendarHeightConstraint: NSLayoutConstraint?
  private lazy var scopeGesture: UIPanGestureRecognizer = {
    [unowned self] in
    let panGesture = UIPanGestureRecognizer(target: self.calendar, action: #selector(self.calendar.handleScopeGesture(_:)))
    panGesture.delegate = self
    panGesture.minimumNumberOfTouches = 1
    panGesture.maximumNumberOfTouches = 2
    return panGesture
  }()
  
  public let calendar = FSCalendar()
  public let tableView = UITableView()
  
  open override func viewDidLoad() {
    super.viewDidLoad()
    
    self.setAttribute()
    self.setConstraint()
  }
}



// MARK: - UI

extension UPsCalendarViewController {
  
  func setAttribute() {
    self.view.backgroundColor = .systemBackground
    self.view.addGestureRecognizer(self.scopeGesture)
    
    self.calendar.locale = Locale(identifier: "ko")
    self.calendar.headerHeight = 0
    self.calendar.calendarHeaderView.isHidden = true
    self.calendar.weekdayHeight = 40
    self.calendar.scope = .month
    self.calendar.collectionView.layer.cornerRadius = 8
    self.calendar.delegate = self
    
    self.calendar.backgroundColor = .systemBackground
    self.calendar.appearance.weekdayTextColor = .systemBrown
    self.calendar.appearance.titleDefaultColor = .systemPink
    self.calendar.appearance.titlePlaceholderColor = .black
    self.calendar.appearance.todayColor = .systemRed
    self.calendar.appearance.selectionColor = .systemBlue
    self.calendar.collectionView.backgroundColor = .darkGray
    
    self.tableView.contentInset.bottom = 16
    self.tableView.showsVerticalScrollIndicator = false
    self.tableView.separatorStyle = .none
    self.tableView.panGestureRecognizer.require(toFail: self.scopeGesture)
    
    [self.calendar, self.tableView].forEach {
      self.view.addSubview($0)
      $0.translatesAutoresizingMaskIntoConstraints = false
    }
  }
  
  private func setConstraint() {
    let guide = self.view.safeAreaLayoutGuide
    let calendatHeight: CGFloat = 360
    
    NSLayoutConstraint.activate([
      self.calendar.topAnchor.constraint(equalTo: guide.topAnchor),
      self.calendar.leadingAnchor.constraint(equalTo: guide.leadingAnchor, constant: 16),
      self.calendar.trailingAnchor.constraint(equalTo: guide.trailingAnchor, constant: -16),
      
      self.tableView.topAnchor.constraint(equalTo: calendar.bottomAnchor, constant: 16),
      self.tableView.leadingAnchor.constraint(equalTo: guide.leadingAnchor),
      self.tableView.trailingAnchor.constraint(equalTo: guide.trailingAnchor),
      self.tableView.bottomAnchor.constraint(equalTo: guide.bottomAnchor)
    ])
    
    self.calendarHeightConstraint = self.calendar.heightAnchor.constraint(equalToConstant: calendatHeight)
    self.calendarHeightConstraint?.isActive = true
  }
}



// MARK: - Action

extension UPsCalendarViewController {
  
  @objc private func todayBarButtonAction() {
    self.calendar.deselect(self.selectDate)
    self.calendar.setCurrentPage(Date(), animated: false)
    self.selectDate = Date()
  }
}



// MARK: - FSCalendarDelegate

extension UPsCalendarViewController: FSCalendarDelegate {
  
  public func calendar(_ calendar: FSCalendar, boundingRectWillChange bounds: CGRect, animated: Bool) {
    self.calendarHeightConstraint?.constant = bounds.height
    self.view.layoutIfNeeded()
  }
  
  public func calendar(_ calendar: FSCalendar, didSelect date: Date, at monthPosition: FSCalendarMonthPosition) {
    self.selectDate = date
  }
}



// MARK: - UIGestureRecognizerDelegate

extension UPsCalendarViewController: UIGestureRecognizerDelegate {
  
  public func gestureRecognizerShouldBegin(_ gestureRecognizer: UIGestureRecognizer) -> Bool {
    let shouldBegin = self.tableView.contentOffset.y <= -self.tableView.contentInset.top
    
    if shouldBegin {
      let velocity = self.scopeGesture.velocity(in: self.view)
      
      switch self.calendar.scope {
      case .month:
        return velocity.y < 0
        
      case .week:
        return velocity.y > 0
        
      @unknown default:
        fatalError()
      }
    }
    return shouldBegin
  }
}
