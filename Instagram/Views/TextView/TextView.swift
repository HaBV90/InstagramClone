//
//  TextView.swift
//  Instagram
//
//  Created by HaBV on 10/02/2023.
//

import UIKit

class TextView: UITextView {
  private let textView: UITextView = {
    let textView = UITextView()
    
    // Setup UI for TextView
    textView.backgroundColor = .clear
    textView.isScrollEnabled = false
    textView.isEditable = false
    textView.textContainerInset = .zero
    textView.textContainer.lineFragmentPadding = 0
    
    // Setup text and link for TextView
    let mutableAttributedString = NSMutableAttributedString(string: "More ways to shop: Visit an Apple Store, call 1-800-MY-APPLE, or find a reseller.")
    mutableAttributedString.setAsLink(textToFind: "Apple Store", linkName: "AppleStoreLink")
    mutableAttributedString.setAsLink(textToFind: "1-800-MY-APPLE", linkName: "ApplePhoneNumber")
    mutableAttributedString.setAsLink(textToFind: "find a reseller", linkName: "FindReseller")
    
    textView.attributedText = mutableAttributedString
    
    return textView
  }()
  
}

extension UITextView {
  func alignTextVerticallyInContainer() {
    var topCorrect = (self.bounds.size.height - self.contentSize.height * self.zoomScale) / 2
    topCorrect = topCorrect < 0.0 ? 0.0 : topCorrect;
    self.contentInset.top = topCorrect
  }
  
  func alignTextVerticalBottomInContainer() {
    self.textAlignment = .center
    self.contentInset.top = self.bounds.size.height
  }
  
}

extension NSMutableAttributedString {
  func setAsLink(textToFind:String, linkName:String) {
    let foundRange = self.mutableString.range(of: textToFind)
    if foundRange.location != NSNotFound {
      self.addAttribute(NSAttributedString.Key.link, value: linkName, range: foundRange)
    }
  }
}
