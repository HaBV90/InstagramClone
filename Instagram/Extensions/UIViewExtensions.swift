//
//  View.swift
//  Instagram
//
//  Created by HaBV on 17/02/2023.
//

import UIKit

extension UIView {
  public func loadViewFromNib(with nibName: String) -> UIView {
    let nibView = UINib(nibName: nibName, bundle: nil).instantiate(withOwner: self).first as! UIView
    return nibView
  }
  public func shadow(shadowColor: CGColor, shadowOffset: CGSize, shadowRadius: Double, shadowOpacity: Float) {
    layer.shadowColor   = shadowColor
    layer.shadowOffset  = shadowOffset
    layer.shadowRadius  = shadowRadius
    layer.shadowOpacity = shadowOpacity
    clipsToBounds       = true
    layer.masksToBounds = false
  }
  
  public func setOutline(cornerRadius: Double, borderWidth: Double, borderColor: CGColor) {
    layer.cornerRadius = cornerRadius
    layer.borderWidth = borderWidth
    layer.borderColor = borderColor
    layer.masksToBounds = true
  }
}
