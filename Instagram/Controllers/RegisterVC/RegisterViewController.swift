//
//  RegisterViewController.swift
//  Instagram
//
//  Created by HaBV on 20/02/2023.
//

import UIKit
import FirebaseAuth

class RegisterViewController: UIViewController {
  
  @IBOutlet weak var titleLabel5: UILabel!
  @IBOutlet weak var subTitleLabel: UILabel!
  @IBOutlet weak var facebookLoginButton: UIButton!
  @IBOutlet weak var separatorLabel: UILabel!
  @IBOutlet weak var emailTextField: UITextField!
  @IBOutlet weak var nameTextField: UITextField!
  @IBOutlet weak var usernameTextField: UITextField!
  @IBOutlet weak var passwordTextField: UITextField!
  @IBOutlet weak var signupButton: UIButton!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
  }
  
  @IBAction func handleSignUp(_ sender: UIButton) {
    if let email = emailTextField.text, let password = passwordTextField.text {
      
      Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
        if let err = error {
          print("error register account error -> \(err)")
        } else {
          print("Register account success!")
          self.navigationController?.popViewController(animated: true)
        }
      }
      
    }
  }
}
