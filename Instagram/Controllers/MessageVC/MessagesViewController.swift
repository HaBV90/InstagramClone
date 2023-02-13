//
//  MessagesViewController.swift
//  Instagram
//
//  Created by HaBV on 31/01/2023.
//

import UIKit

class MessagesViewController: UIViewController {
  
  var scrollView = UIScrollView()
  var stackView = UIStackView()
  var contentView = UIView()
  var contentStackView = UIStackView()
  var imageView = UIImageView()
  var titleLabel = UILabel()
  var inputField = UITextField()
  var inputFieldOne = UITextField()
  var inputFieldTwo = UITextField()
  var inputFieldThree = UITextField()
  var inputFieldFour = UITextField()
  var inputFieldFive = UITextField()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    self.navigationItem.title = "ScrollView"
    self.view.addSubview(scrollView)
    self.scrollView.addSubview(stackView)
    configScrollView()
  }
  
  private func configScrollView() {
    scrollView.translatesAutoresizingMaskIntoConstraints = false
    scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
    scrollView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor).isActive = true
    scrollView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor).isActive = true
    scrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
    scrollView.alwaysBounceVertical = true
    configStackView()
  }
  
  private func configStackView() {
    stackView.translatesAutoresizingMaskIntoConstraints = false
    stackView.backgroundColor = .white
    stackView.axis = .vertical
    stackView.distribution = UIStackView.Distribution.equalSpacing
    stackView.spacing = 16
    
    stackView.topAnchor.constraint(equalTo: scrollView.topAnchor).isActive = true
    stackView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 16).isActive = true
    stackView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: 16).isActive = true
    stackView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor).isActive = true
    stackView.widthAnchor.constraint(equalTo: scrollView.widthAnchor, constant: scrollView.bounds.width - 32).isActive = true
    
    self.stackView.addSubview(contentView)
    self.stackView.addSubview(contentStackView)
    configContentView()
    configContentStackView()
  }
  
  private func configContentView() {
    self.contentView.addSubview(imageView)
    self.contentView.addSubview(titleLabel)
    contentView.translatesAutoresizingMaskIntoConstraints = false
    contentView.topAnchor.constraint(equalTo: stackView.topAnchor).isActive = true
    contentView.bottomAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 16).isActive = true
    contentView.leadingAnchor.constraint(equalTo: stackView.leadingAnchor).isActive = true
    contentView.trailingAnchor.constraint(equalTo: stackView.trailingAnchor).isActive = true
    configImageView()
    configLabelView()
  }
  
  private func configImageView() {
    imageView.translatesAutoresizingMaskIntoConstraints = false
    imageView.widthAnchor.constraint(equalToConstant: 120).isActive = true
    imageView.heightAnchor.constraint(equalToConstant: 120).isActive = true
    imageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16).isActive = true
    imageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
    imageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
    imageView.image = UIImage(named: "Logo")
    imageView.contentMode = .scaleAspectFit
  }
  
  private func configLabelView() {
    titleLabel.translatesAutoresizingMaskIntoConstraints = false
    titleLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 16).isActive = true
    titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
    titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
    titleLabel.text = "UIStackView inside UIScrollView."
    titleLabel.font = UIFont.systemFont(ofSize: 24, weight: .medium)
    titleLabel.textColor = .darkText
    titleLabel.textAlignment = .center
  }
  
  private func configContentStackView() {
    self.contentStackView.addSubview(inputField)
    self.contentStackView.addSubview(inputFieldOne)
    self.contentStackView.addSubview(inputFieldTwo)
    self.contentStackView.addSubview(inputFieldThree)
    self.contentStackView.addSubview(inputFieldFour)
    self.contentStackView.addSubview(inputFieldFive)
    contentStackView.translatesAutoresizingMaskIntoConstraints = false
    contentStackView.backgroundColor = .white
    contentStackView.axis = .vertical
    contentStackView.distribution = .fill
    contentStackView.alignment = .fill
    contentStackView.spacing = 16
    
    contentStackView.topAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 16).isActive = true
    contentStackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
    contentStackView.leadingAnchor.constraint(equalTo: stackView.leadingAnchor).isActive = true
    contentStackView.trailingAnchor.constraint(equalTo: stackView.trailingAnchor).isActive = true
    contentView.center.x = view.center.x
    
    inputField.placeholder = "First Name"
    inputFieldOne.placeholder = "Last Name"
    inputFieldTwo.placeholder = "Birthday"
    inputFieldThree.placeholder = "Email"
    inputFieldFour.placeholder = "Phone"
    inputFieldFive.placeholder = "Address"
    configInputField(with: inputField)
    configInputField(with: inputFieldOne)
    configInputField(with: inputFieldTwo)
    configInputField(with: inputFieldThree)
    configInputField(with: inputFieldFour)
    configInputField(with: inputFieldFive)
    inputFieldOne.topAnchor.constraint(equalTo: inputField.bottomAnchor, constant: 16).isActive = true
    inputFieldTwo.topAnchor.constraint(equalTo: inputFieldOne.bottomAnchor, constant: 16).isActive = true
    inputFieldThree.topAnchor.constraint(equalTo: inputFieldTwo.bottomAnchor, constant: 16).isActive = true
    inputFieldFour.topAnchor.constraint(equalTo: inputFieldThree.bottomAnchor, constant: 16).isActive = true
    inputFieldFive.topAnchor.constraint(equalTo: inputFieldFour.bottomAnchor, constant: 16).isActive = true
  }
  
  private func configInputField(with input: UITextField) {
    input.translatesAutoresizingMaskIntoConstraints = false
    input.heightAnchor.constraint(equalToConstant: 60).isActive = true
    input.leadingAnchor.constraint(equalTo: contentStackView.leadingAnchor).isActive = true
    input.trailingAnchor.constraint(equalTo: contentStackView.trailingAnchor).isActive = true
   
  }
  
}
