//
//  LoginViewController.swift
//  Instagram
//
//  Created by HaBV on 01/02/2023.
//

import UIKit
import FirebaseAuth

class LoginViewController: UIViewController {
  let auth = AuthenticationModel.shared
  
  @IBOutlet weak var titleLabel: UILabel!
  @IBOutlet weak var loginButton: UIButton!
  @IBOutlet weak var skipButton: UIButton!
  @IBOutlet weak var usernameTextField: UITextField!
  @IBOutlet weak var passwordTextField: UITextField!
  @IBOutlet weak var forgotPasswordBtn: UIButton!
  @IBOutlet var textView: UITextView!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    self.textView.delegate = self
    
    usernameTextField.placeholder = "Username"
    usernameTextField.setOutline(cornerRadius: 8, borderWidth: 1, borderColor: UIColor.lightGray.cgColor)
    usernameTextField.text = "abc@gmail.com"
    passwordTextField.text = "123456"
    
    passwordTextField.placeholder = "Password"
    passwordTextField.isSecureTextEntry = true
    passwordTextField.setOutline(cornerRadius: 8, borderWidth: 1, borderColor: UIColor.lightGray.cgColor)
    
    loginButton.setOutline(cornerRadius: 8, borderWidth: 1, borderColor: loginButton.tintColor.cgColor)
    skipButton.setOutline(cornerRadius: 8, borderWidth: 1, borderColor: skipButton.tintColor.cgColor)
    
    let mutableAttributedString = NSMutableAttributedString(string: "Don't have an account? Sign Up.")
    mutableAttributedString.setAsLink(textToFind: "Sign Up.", linkName: "signUp")
    textView.attributedText = mutableAttributedString
    textView.textAlignment = .center
    textView.font = UIFont.systemFont(ofSize: 14)
    textView.alignTextVerticalBottomInContainer()
    textView.isEditable = false
    
  }
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
  }
  
  @IBAction func handleForgotPasswordPressed(_ sender: UIButton) {
    let forgotVC = ForgotPasswordViewController()
    self.navigationController?.pushViewController(forgotVC, animated: true)
  }
  
  @IBAction func handleLoginPressed(_ sender: UIButton) {
    self.showSpinner(onView: self.view)
    
    if let email = usernameTextField.text, let password = passwordTextField.text {
      Auth.auth().signIn(withEmail: email, password: password) { [weak self] authResult, error in
        guard let strongSelf = self else { return }
        strongSelf.removeSpinner()
        if let err = error {
          print("login error -> \(err)")
        } else {
          DispatchQueue.main.async {
            self?.auth.isAuthentication = true
            let rootVC = TabBarViewController()
            (UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate)?.changeRootViewController(rootVC)
          }
        }
      }
    }
  }
  
  @IBAction func handleSkipPressed(_ sender: UIButton) {
    let rootVC = TabBarViewController()
    (UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate)?.changeRootViewController(rootVC)
  }
}

extension LoginViewController:  UITextViewDelegate {
  func textView(_ textView: UITextView, shouldInteractWith URL: URL, in characterRange: NSRange) -> Bool {
    
    if URL.absoluteString == "signUp" {
      print("URL -->> \(URL)")
      let registerVC = RegisterViewController()
      self.navigationController?.pushViewController(registerVC, animated: true)
      return true
    }
    return false
  }
}
