//
//  UPsFormatter.swift
//  UPsKit
//
//  Created by UPs on 2022/09/10.
//

import Foundation

public enum UPsFormatter {
  
  public enum Date: String {
    case HHmmss = "HH:mm:ss"
    case MdEEEEEHHmm = "M월 d일 (EEEEE) HH:mm"
    case MdEEEEEHHmmss = "M월 d일 (EEEEE) HH:mm:ss"
    case yyyyMMdd = "yyyy-MM-dd"
  }
  
  public enum Timer {
    case HM
    case HMSM
    case MSM
    case SM
  }
  
  public enum Pattern: String {
    case phone = "###-####-####"
    case business = "###-##-#####"
  }
}
