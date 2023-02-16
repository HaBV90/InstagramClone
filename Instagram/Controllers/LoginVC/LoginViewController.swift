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
  @IBOutlet weak var skipButton: UIButton!
  @IBOutlet weak var usernameView: UITextField!
  @IBOutlet weak var passwordView: UITextField!
  @IBOutlet weak var forgotPasswordBtn: UIButton!
  @IBOutlet var textView: UITextView!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    self.textView.delegate = self
    
    usernameView.placeholder = "Username"
    usernameView.setOutline(cornerRadius: 8, borderWidth: 1, borderColor: UIColor.lightGray.cgColor)
    
    
    passwordView.placeholder = "Password"
    passwordView.isSecureTextEntry = true
    passwordView.setOutline(cornerRadius: 8, borderWidth: 1, borderColor: UIColor.lightGray.cgColor)
    
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
    let forgotVC = UIViewController(nibName: "ForgotPasswordViewController", bundle: nil)
    self.navigationController?.pushViewController(forgotVC, animated: true)
  }
  
  @IBAction func handleLoginPressed(_ sender: UIButton) {
    let defaults = UserDefaults.standard
    defaults.set(true, forKey: K.IsLogged)
    
    let loadingVC = LoadingViewController()
    loadingVC.view.frame = view.frame
    view.addSubview(loadingVC.view)
    loadingVC.didMove(toParent: self)
    // wait two seconds to simulate some work happening
    DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
      // then remove the spinner view controller
      loadingVC.willMove(toParent: nil)
      loadingVC.view.removeFromSuperview()
      loadingVC.removeFromParent()
      
      let rootVC = TabBarViewController()
      (UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate)?.changeRootViewController(rootVC)
    }
  }
  
  @IBAction func handleSkipPressed(_ sender: UIButton) {
    let defaults = UserDefaults.standard
    defaults.set(false, forKey: K.IsLogged)
    let rootVC = TabBarViewController()
    (UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate)?.changeRootViewController(rootVC)
  }
}

extension LoginViewController:  UITextViewDelegate {
  func textView(_ textView: UITextView, shouldInteractWith URL: URL, in characterRange: NSRange) -> Bool {
    
    if URL.absoluteString == "signUp" {
      print("URL -->> \(URL)")
      
      let registerVC = UIViewController(nibName: "RegisterViewController", bundle: nil)
      self.navigationController?.pushViewController(registerVC, animated: true)
      return true
    }
    return false
  }
}
