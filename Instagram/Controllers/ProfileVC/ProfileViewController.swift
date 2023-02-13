//
//  ProfileViewController.swift
//  Instagram
//
//  Created by HaBV on 31/01/2023.
//

import UIKit

class ProfileViewController: UIViewController {
  @IBOutlet weak var signOutButton: UIButton!
  let defaults = UserDefaults.standard
  
  override func viewDidLoad() {
    super.viewDidLoad()
  }
  
  @IBAction func handleLogOut(_ sender: UIButton) {
    let loginVC = LoginViewController()
    defaults.set(false, forKey: "isLogged")
    let authNavigation = UINavigationController(rootViewController: loginVC)
    (UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate)?.changeRootViewController(authNavigation)
  }
  
}
