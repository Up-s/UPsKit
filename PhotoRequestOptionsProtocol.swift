//
//  PhotoRequestOptionsProtocol.swift
//  UPsKit
//
//  Created by YouUp Lee on 2023/07/30.
//

import Foundation
import Photos

public protocol PhotoRequestOptionsProtocol {
  
  var isNetworkAccessAllowed: Bool { get }
  var deliveryMode: PHImageRequestOptionsDeliveryMode { get }
  var isSynchronous: Bool { get }
  var resizeMode: PHImageRequestOptionsResizeMode { get }
  var version: PHImageRequestOptionsVersion { get }
  var size: CGSize { get }
}



public struct DebugFormatOptions: PhotoRequestOptionsProtocol {
  
  public let isNetworkAccessAllowed: Bool = true
  public let deliveryMode: PHImageRequestOptionsDeliveryMode = .fastFormat
  public let isSynchronous: Bool = true
  public let resizeMode: PHImageRequestOptionsResizeMode = .fast
  public let version: PHImageRequestOptionsVersion = .current
  public let size: CGSize = CGSize(width: 50, height: 50)
}

public struct FastFormatOptions: PhotoRequestOptionsProtocol {
  
  public let isNetworkAccessAllowed: Bool = true
  public let deliveryMode: PHImageRequestOptionsDeliveryMode = .opportunistic
  public let isSynchronous: Bool = false
  public let resizeMode: PHImageRequestOptionsResizeMode = .fast
  public let version: PHImageRequestOptionsVersion = .current
  public let size: CGSize = CGSize(width: 400, height: 400)
}

public struct HighQualityFormatOptions: PhotoRequestOptionsProtocol {
  
  public let isNetworkAccessAllowed: Bool = true
  public let deliveryMode: PHImageRequestOptionsDeliveryMode = .highQualityFormat
  public let isSynchronous: Bool = true
  public let resizeMode: PHImageRequestOptionsResizeMode = .none
  public let version: PHImageRequestOptionsVersion = .original
  public let size: CGSize = PHImageManagerMaximumSize
}

public struct FirebaseFormatOptions: PhotoRequestOptionsProtocol {
  
  public let isNetworkAccessAllowed: Bool = true
  public let deliveryMode: PHImageRequestOptionsDeliveryMode = .highQualityFormat
  public let isSynchronous: Bool = true
  public let resizeMode: PHImageRequestOptionsResizeMode = .none
  public let version: PHImageRequestOptionsVersion = .original
  public let size: CGSize = CGSize(width: 800, height: 800)
}

