//
//  CustomHeaderView.swift
//  Instagram
//
//  Created by HaBV on 14/02/2023.
//

import UIKit


class CustomHeaderView: UIView {
  
  @IBOutlet weak var imageView: UIImageView!
  @IBOutlet var colorView: UIView!
  @IBOutlet weak var titleLabel: UILabel!
  var bgColor = UIColor(red: 235/255, green: 96/255, blue: 91/255, alpha: 1)
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    setupViews()
  }
  
  required init?(coder: NSCoder) {
    super.init(coder: coder)
    setupViews()
  }
  
  func setupViews() {
    colorView.backgroundColor = bgColor
    colorView.alpha = 0.6
  }
  
  var title: String? {
    get { return titleLabel?.text }
    set { titleLabel?.text = newValue }
  }
  
  func decrementColorAlpha(offset: CGFloat) {
    if colorView.alpha <= 1 {
      let alphaOffset = (offset/500)/85
      self.colorView.alpha += alphaOffset
    }
  }
  
  
  func decrementArticleAlpha(offset: CGFloat) {
    if imageView.alpha >= 0 {
      let alphaOffset = max((offset - 65)/85.0, 0)
      self.imageView.alpha = alphaOffset
    }
  }
  func incrementColorAlpha(offset: CGFloat) {
    if self.colorView!.alpha >= 0.6 {
      let alphaOffset = (offset/200)/85
      self.colorView.alpha -= alphaOffset
    }
  }
  func incrementArticleAlpha(offset: CGFloat) {
    if imageView.alpha <= 1 {
      let alphaOffset = max((offset - 65)/85, 0)
      self.imageView.alpha = alphaOffset
    }
  }
  
}
