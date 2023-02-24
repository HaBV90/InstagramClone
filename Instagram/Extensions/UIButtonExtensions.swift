//
//  UIButtonExtensions.swift
//  Instagram
//
//  Created by HaBV on 24/02/2023.
//

import Foundation
import UIKit

extension UIButton {
//  public func shadow(shadowColor: CGColor, shadowOffset: CGSize, shadowRadius: Double, shadowOpacity: Float) {
//    layer.shadowColor   = shadowColor
//    layer.shadowOffset  = shadowOffset
//    layer.shadowRadius  = shadowRadius
//    layer.shadowOpacity = shadowOpacity
//    clipsToBounds       = true
//    layer.masksToBounds = false
//  }
//  
//  public func setOutline(cornerRadius: Double, borderWidth: Double, borderColor: CGColor) {
//    layer.cornerRadius = cornerRadius
//    layer.borderWidth = borderWidth
//    layer.borderColor = borderColor
//    layer.masksToBounds = true
//  }
}

// MARK: - Animation Button
extension UIButton {
  func shake() {
    let shake = CABasicAnimation(keyPath: "position")
    shake.duration = 0.1
    shake.repeatCount = 2
    shake.autoreverses = true
    let fromPoint = CGPoint(x: center.x - 8, y: center.y)
    let fromValue       = NSValue(cgPoint: fromPoint)
    let toPoint         = CGPoint(x: center.x + 8, y: center.y)
    let toValue         = NSValue(cgPoint: toPoint)
    shake.fromValue     = fromValue
    shake.toValue       = toValue
    layer.add(shake, forKey: "position")
  }
}
