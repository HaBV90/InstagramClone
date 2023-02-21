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
}

extension UILabel {
  func drawLineOnBothSides(labelWidth: CGFloat, color: UIColor, height: CGFloat?) {
    let fontAttributes = [NSAttributedString.Key.font: self.font]
    let size = self.text?.size(withAttributes: fontAttributes as [NSAttributedString.Key : Any])
    let widthOfString = size!.width
    print("Label width -> \(labelWidth)")
    print("view width -> \(self.frame.width)")
    print("width of string label -> \(widthOfString)")
    let heightSeparator = height ?? CGFloat(1)
    self.backgroundColor = .darkGray
    
    //    let width = (labelWidth - widthOfString) / 2
    
    let leftLine = UIView(frame: CGRect(x: 0, y: (self.frame.height - heightSeparator) / 2, width: self.frame.width / 2 - widthOfString, height: heightSeparator))
    leftLine.backgroundColor = color
    self.addSubview(leftLine)
    
    let rightLine = UIView(frame: CGRect(x: (self.frame.width + widthOfString) / 2, y: (self.frame.height - heightSeparator) / 2, width: self.frame.width / 2 - widthOfString, height: heightSeparator))
    rightLine.backgroundColor = color
    self.addSubview(rightLine)
  }
}
