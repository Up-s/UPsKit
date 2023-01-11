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
    case MdEEEEE = "M월 d일 (EEEEEE)"
    case MdEEEEEHHmm = "M월 d일 (EEEEE) HH:mm"
    case MdEEEEEHHmmss = "M월 d일 (EEEEE) HH:mm:ss"
    case yyyy_MM_dd = "yyyy-MM-dd"
    
    case yyyy = "yyyy"
    case MM = "MM"
    case dd = "dd"
    case yyyyMM = "yyyyMM"
    case yyyyMMdd = "yyyyMMdd"
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
    case hourMin = "##:##"
  }
}
