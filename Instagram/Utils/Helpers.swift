//
//  Helpers.swift
//  Instagram
//
//  Created by HaBV on 08/02/2023.
//

import Foundation
import UIKit

class Helpers {
  
  public func loadViewFromNib(_ nibName: String) -> UIView {
    let nibView = UINib(nibName: nibName, bundle: nil).instantiate(withOwner: self).first as! UIView
    return nibView
  }
  
}
