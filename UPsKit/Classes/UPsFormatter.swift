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
    case yyyy_MM_dd = "yyyy-MM-dd"
    case yyyyMMdd
    case yyyyMM
    case yyyy
    case MM
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
