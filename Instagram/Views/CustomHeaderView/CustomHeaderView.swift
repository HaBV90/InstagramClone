//
//  CustomHeaderView.swift
//  Instagram
//
//  Created by HaBV on 14/02/2023.
//

import UIKit

struct CustomHeaderViewModel {
  var title: String
  var iconName: String?
  var titleColor: UIColor?
  var iconColor: UIColor?
  var bgColor: UIColor?
}

class CustomHeaderView: UIView {
  
  private var viewModel: CustomHeaderViewModel?
  @IBOutlet weak var imageView: UIImageView!
  @IBOutlet var colorView: UIView!
  @IBOutlet weak var titleLabel: UILabel!
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    self.viewModel = nil
  }
  
  required init?(coder: NSCoder) {
    super.init(coder: coder)
  }
  
  @IBInspectable var title: String? {
    get { return titleLabel?.text }
    set {
      titleLabel?.text = newValue
      titleLabel?.textColor = .red
    }
  }
  
  init(with viewModel: CustomHeaderViewModel) {
    self.viewModel = viewModel
    super.init(frame: .zero)
    configuration(with: viewModel)
  }
  
  public func configuration(with viewModel: CustomHeaderViewModel) {
    let myView = loadViewFromNib(with: "CustomHeaderView")
    myView.frame = bounds
    addSubview(myView)
    
    titleLabel?.text = viewModel.title
    if let image = viewModel.iconName {
      imageView?.image = UIImage(systemName: image)
    }
    colorView?.backgroundColor = viewModel.bgColor
    titleLabel?.textColor = viewModel.titleColor ?? .red
  }
  
  override func layoutSubviews() {
    super.layoutSubviews()
  }
  
  private func loadViewFromNib(with nibName: String) -> UIView {
    let nibView = UINib(nibName: nibName, bundle: nil).instantiate(withOwner: self).first as! UIView
    return nibView
  }
  
}
