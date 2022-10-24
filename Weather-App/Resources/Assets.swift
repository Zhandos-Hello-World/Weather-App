//
//  Assets.swift
//  Weather-App
//
//  Created by Zhandos Baimurat on 25.10.2022.
//

import Foundation
import UIKit

internal enum Assets {
    internal static let mainBackground = ImageAsset(name: "main_background")
    internal static let home = ImageAsset(name: "home")
}


internal struct ImageAsset {
    internal fileprivate(set) var name: String
    
    internal var image: UIImage {
      let bundle = BundleToken.bundle
      #if os(iOS)
      let image = UIImage(named: name, in: bundle, compatibleWith: nil)
      #endif
      guard let result = image else {
        fatalError("Unable to load image named \(name).")
      }
      return result
    }
}

private final class BundleToken {
  static let bundle: Bundle = {
    #if SWIFT_PACKAGE
    return Bundle.module
    #else
    return Bundle(for: BundleToken.self)
    #endif
  }()
}
