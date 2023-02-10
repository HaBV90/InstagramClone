//
//  LoginViewController.swift
//  Instagram
//
//  Created by HaBV on 01/02/2023.
//

import UIKit

class LoginViewController: UIViewController {
  
  
  @IBOutlet weak var titleLabel: UILabel!
  @IBOutlet weak var loginButton: UIButton!
  @IBOutlet weak var usernameView: AppTextField!
  @IBOutlet weak var passwordView: AppTextField!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    loginButton.setImage(UIImage(systemName: "person"), for: .normal)
    usernameView.contentView.layer.borderWidth = 1
    usernameView.contentView.layer.borderColor = UIColor.red.cgColor
    usernameView.contentView.layer.cornerRadius = 8
    usernameView.contentView.clipsToBounds = true
    
    //    passwordView.backgroundColor = .systemBackground
    //    passwordView.placeholder = "password"
    //    passwordView.image = UIImage(systemName: "lock")
    //    passwordView.contentView.layer.borderWidth = 1
    //    passwordView.contentView.layer.borderColor = UIColor.red.cgColor
    //    passwordView.contentView.layer.cornerRadius = 8
    //    passwordView.contentView.clipsToBounds = true
    //    passwordView.setPasswordType = true
    //    passwordView.showButton.setImage(UIImage(systemName: "eye"), for: .normal)
    //    passwordView.appTextField.backgroundColor = UIColor.lightGray
    
  }
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    passwordView.setupView(placeholder: "Password", backgroundColor: nil, leftImage: UIImage(systemName: "lock"), showClearButton: nil, showImage: nil, isSecureTextEntry: true)

  }
  

}
