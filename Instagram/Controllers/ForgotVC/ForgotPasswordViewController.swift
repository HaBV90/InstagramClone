//
//  ForgotPasswordViewController.swift
//  Instagram
//
//  Created by HaBV on 17/02/2023.
//

import UIKit

class ForgotPasswordViewController: UIViewController {
  
  @IBOutlet weak var imageView: UIImageView!
  @IBOutlet weak var titleLabel: UILabel!
  @IBOutlet weak var subTitle: UILabel!
  @IBOutlet weak var usernameInput: UITextField!
  @IBOutlet weak var sendButton: UIButton!
  @IBOutlet weak var resetButton: UIButton!
  @IBOutlet weak var separatorLabel: UILabel!
  @IBOutlet weak var createButton: UIButton!
  @IBOutlet weak var backLoginButton: UIButton!
  
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    separatorLabel.drawLineOnBothSides(labelWidth: self.separatorLabel.frame.width, color: .red, height: nil)
  }
  
}
