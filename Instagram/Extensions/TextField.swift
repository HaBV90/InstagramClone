//
//  TextField.swift
//  Instagram
//
//  Created by HaBV on 16/02/2023.
//

import UIKit

extension UITextField {
  public func setOutline(cornerRadius: Double, borderWidth: Double, borderColor: CGColor) {
    layer.cornerRadius = cornerRadius
    layer.borderWidth = borderWidth
    layer.borderColor = borderColor
    layer.masksToBounds = true
  }
  
  func addPaddingAndIcon(_ image: UIImage, padding: CGFloat,isLeftView: Bool) {
    let frame = CGRect(x: 0, y: 0, width: image.size.width + padding, height: image.size.height)
    
    let outerView = UIView(frame: frame)
    let iconView  = UIImageView(frame: frame)
    iconView.image = image
    iconView.contentMode = .center
    outerView.addSubview(iconView)
    
    if isLeftView {
      leftViewMode = .always
      leftView = outerView
    } else {
      rightViewMode = .always
      rightView = outerView
    }
  }
  
  func setLeftView(_ view: UIView, padding: CGFloat) {
    view.translatesAutoresizingMaskIntoConstraints = true
    
    let outerView = UIView()
    outerView.translatesAutoresizingMaskIntoConstraints = false
    outerView.addSubview(view)
    
    outerView.frame = CGRect(
      origin: .zero,
      size: CGSize(
        width: view.frame.size.width + padding,
        height: view.frame.size.height + padding
      )
    )
    
    view.center = CGPoint(
      x: outerView.bounds.size.width / 2,
      y: outerView.bounds.size.height / 2
    )
    
    leftView = outerView
  }
  
}
