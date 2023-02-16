//
//  SeparatorView.swift
//  Instagram
//
//  Created by HaBV on 16/02/2023.
//

import UIKit

@IBDesignable
class SeparatorView: UIView {
  
  
  @IBInspectable
  var separatorColor: UIColor = UIColor.lightGray {
    didSet {
      setNeedsDisplay()
    }
  }
  
  override func awakeFromNib() {
    super.awakeFromNib()
    commonSetup()
  }
  
  override func prepareForInterfaceBuilder() {
    super.prepareForInterfaceBuilder()
    commonSetup()
  }
  
  func commonSetup() {
    
  }
}
