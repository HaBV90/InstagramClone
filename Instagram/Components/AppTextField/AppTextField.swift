//
//  AppTextField.swift
//  Instagram
//
//  Created by HaBV on 02/02/2023.
//

import UIKit

@IBDesignable class AppTextField: UIView {
  
  @IBOutlet var contentView: UIView!
  @IBOutlet weak var imageContainer: UIView!
  @IBOutlet weak var imageView: UIImageView!
  @IBOutlet weak var appTextField: UITextField!
  @IBOutlet weak var clearButton: UIButton!
  @IBOutlet weak var showButton: UIButton!
  
  internal var _backgroundColor: UIColor? = .systemBackground
  internal var leftIcon: UIImage?
  internal var clearIcon: UIImage?
  internal var showIcon: UIImage?
  internal var imageColor: UIColor?
  internal var clearImageColor: UIColor?
  internal var showImageColor: UIColor?
  
  @IBInspectable var leftImage: UIImage? {
    get { return imageView.image }
    set {
      if (newValue != nil) {
        imageContainer.isHidden = false
        imageView?.image = newValue
        leftIcon = newValue
      }
    }
  }
  
  @IBInspectable var showImage: UIImage? {
    get { return showButton.imageView?.image }
    set {showButton.setImage(newValue, for: .normal)}
  }
  
  @IBInspectable var clearImage: UIImage? {
    get {return clearButton.imageView?.image}
    set {clearButton.setImage(newValue, for: .normal)}
  }
  
  @IBInspectable var placeholder: String? {
    get { return appTextField.placeholder }
    set { appTextField.placeholder = newValue }
  }
  
  @IBInspectable var setBackgroundColor: UIColor? {
    get { return _backgroundColor }
    set { _backgroundColor = newValue }
  }
  
  @IBInspectable var setPasswordType: Bool {
    get { return appTextField.isSecureTextEntry }
    set {
      appTextField.isSecureTextEntry = newValue
      showButton.tintColor = appTextField.isSecureTextEntry ? UIColor.lightGray : UIColor.systemBlue
      if (showButton.imageView?.image == nil) {
        showButton.setImage(UIImage(systemName: "eye"), for: .normal)
      }
    }
  }
  
  func configUI() {
    
  }
  
  func setupView(placeholder: String?, backgroundColor: UIColor?, leftImage: UIImage?, showClearButton: Bool?, showImage: UIImage?, isSecureTextEntry: Bool = false) {
    self.appTextField.placeholder = placeholder ?? appTextField.placeholder
    self.contentView.backgroundColor = backgroundColor ?? _backgroundColor
    self.appTextField.backgroundColor = backgroundColor ?? _backgroundColor
    self.showButton.backgroundColor = backgroundColor ?? _backgroundColor
    self.clearButton.backgroundColor = backgroundColor ?? _backgroundColor
    self.imageView.image = leftImage ?? imageView.image
    if (isSecureTextEntry) {
      showButton.tintColor = isSecureTextEntry ? UIColor.lightGray : UIColor.systemBlue
      (showImage != nil) ? showButton.setImage(showImage, for: .normal) : showButton.setImage(UIImage(systemName: "eye"), for: .normal)
    }
  }

  
  @IBAction func onPressedClearButton(_ sender: UIButton) {
    appTextField.text = ""
  }
  
  @IBAction func onPressedShowButton(_ sender: UIButton) {
    appTextField.isSecureTextEntry.toggle()
    showButton.tintColor = appTextField.isSecureTextEntry ? UIColor.lightGray : UIColor.systemBlue
  }
  
  required init?(coder: NSCoder) {
    super.init(coder: coder)
    initSubviews()
  }
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    initSubviews()
  }
  
  override func layoutSubviews() {
    self.backgroundColor = UIColor.black
    setupView(placeholder: placeholder, backgroundColor: _backgroundColor, leftImage: leftIcon, showClearButton: nil, showImage: showIcon)
  }
  
  func initSubviews() {
    let myView = loadViewFromNib()
    myView.frame = bounds
    myView.backgroundColor = _backgroundColor
    addSubview(myView)
    appTextField.delegate = self
    
    appTextField.backgroundColor = _backgroundColor
    showButton.backgroundColor = _backgroundColor
    clearButton.backgroundColor = _backgroundColor
    appTextField.borderStyle = .none
    appTextField.layer.borderWidth = 0
    if imageView.image == nil {
      imageContainer.isHidden = true
    }
  }
  
  private func loadViewFromNib() -> UIView {
    let nibView = UINib(nibName: "AppTextField", bundle: nil).instantiate(withOwner: self).first as! UIView
    return nibView
  }
  
}

// MARK: - UITextFieldDelegate

extension AppTextField: UITextFieldDelegate {
    
  func textFieldDidBeginEditing(_ textField: UITextField) {
    print("Input is focused")
  }
  
  func textFieldDidEndEditing(_ textField: UITextField) {
    //TODO
  }
  
  func textFieldDidChangeSelection(_ textField: UITextField) {
    print("start typing")
    print("isPasswordType -->> \(appTextField.isSecureTextEntry)")
  }
}
