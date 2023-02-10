//
//  ForgotPasswordViewController.swift
//  Instagram
//
//  Created by HaBV on 10/02/2023.
//

import UIKit

class ForgotPasswordViewController: UIViewController {
  @IBOutlet weak var titleLabel: UILabel!
  @IBOutlet weak var logoImage: UIImageView!
  @IBOutlet weak var usernameTextField: AppTextField!
  @IBOutlet weak var accountTextField: AppTextField!
  @IBOutlet weak var forgotButton: UIButton!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    self.title = "Forgot Password Screen"
  }
  
  override func loadView() {
    super.loadView()
  }
  
}
