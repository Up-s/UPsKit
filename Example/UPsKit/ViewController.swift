//
//  ViewController.swift
//  UPsKit
//
//  Created by UPs on 05/26/2022.
//  Copyright (c) 2022 UPs. All rights reserved.
//

import UIKit
import UPsKit

class ViewController: UIViewController {
  
  let test = TestUPsKit()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    test.opnePrint()
    test.hiPrint()
//    test.byePrint()
  }
}

