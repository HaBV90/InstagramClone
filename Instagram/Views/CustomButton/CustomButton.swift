//
//  CustomButton.swift
//  Instagram
//
//  Created by HaBV on 07/02/2023.
//

import UIKit

struct CustomButtonViewModel {
  var title: String
  var iconName: String
  var titleColor: UIColor?
  var iconColor: UIColor?
}

enum ButtonStyle {
  
}

class CustomButton: UIButton {
  
  private var viewModel: CustomButtonViewModel?
  
  var iconSize: CGSize? {
    get { return myImageView.image?.size }
    set {}
  }
  
  var myTitleLabel: UILabel = {
    let label = UILabel()
    label.numberOfLines = 1
    label.textAlignment = .center
    label.textColor = .red
    return label
  }()
  
  var myImageView: UIImageView = {
    let imageView = UIImageView()
    imageView.contentMode = .scaleAspectFit
    imageView.tintColor = .red
    return imageView
  }()
  
  init(with viewModel: CustomButtonViewModel) {
    self.viewModel = viewModel
    super.init(frame: .zero)
    addSubviews()
    configuration(with: viewModel)
  }
  
  private func addSubviews() {
    guard !myTitleLabel.isDescendant(of: self) else { return }
    addSubview(myTitleLabel)
    addSubview(myImageView)
  }
  
  required init?(coder: NSCoder) {
    super.init(coder: coder)
  }
  
  override init(frame: CGRect) {
    self.viewModel = nil
    super.init(frame: frame)
  }
  
  override func layoutSubviews() {
    super.layoutSubviews()
    
    myImageView.frame = CGRect(x: 8, y: 0, width: 24, height: frame.height)
    myImageView.backgroundColor = .purple
    myTitleLabel.frame = CGRect(x: Int(myImageView.frame.width) + 16, y: 0, width: Int(frame.width - myImageView.frame.width) - 24, height: Int(frame.height))
    myTitleLabel.textAlignment = .center
    myTitleLabel.backgroundColor = .cyan
  }
  
  public func configuration(with viewModel: CustomButtonViewModel) {
    addSubviews()
    
    myTitleLabel.text = viewModel.title
    myImageView.image = UIImage(systemName: viewModel.iconName)
  }
  
}

// MARK: - Button Style
extension UIButton {
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
