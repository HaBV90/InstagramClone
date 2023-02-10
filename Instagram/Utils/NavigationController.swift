//
//  NavigationController.swift
//  Instagram
//
//  Created by HaBV on 07/02/2023.
//

import UIKit

extension UINavigationController {
  
  func backToVC(vc: Swift.AnyClass) {
    for element in viewControllers as Array {
      if element.isKind(of: vc) {
        self.popToViewController(element, animated: true)
        break
      }
    }
  }
}


