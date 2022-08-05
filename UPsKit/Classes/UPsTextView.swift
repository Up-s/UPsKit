//
//  UPsTextView.swift
//  UPsKit
//
//  Created by UPs on 2022/08/05.
//

import UIKit

public class UPsTextView: UITextView {
  
  // MARK: - Property
  
  public var placeholderText: String? {
    willSet {
      self.text = newValue
      self.textColor = .placeholderText
    }
  }
  
  
  
  // MARK: - Life Cycle
  
  public init() {
    super.init(frame: .zero, textContainer: nil)
    
    self.setAttribute()
    self.setConstraint()
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  
  
  // MARK: - Interface
  
  
  
  // MARK: - UI
  
  private func setAttribute() {
    self.delegate = self
    self.textContainerInset = UIEdgeInsets(all: 16.0)
  }
  
  private func setConstraint() {
  }
}



// MARK: - UITextViewDelegate

extension UPsTextView: UITextViewDelegate {
  
  public func textViewDidBeginEditing(_ textView: UITextView) {
    if textView.text == self.placeholderText {
      textView.text = nil
      textView.textColor = .black
    }
  }

  public func textViewDidEndEditing(_ textView: UITextView) {
    if textView.text.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty {
      textView.text = self.placeholderText
      textView.textColor = .placeholderText
    }
  }
}
