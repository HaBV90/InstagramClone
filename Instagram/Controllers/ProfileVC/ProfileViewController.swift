//
//  ProfileViewController.swift
//  Instagram
//
//  Created by HaBV on 31/01/2023.
//

import UIKit

class ProfileViewController: UIViewController {
  var signOutButton = UIButton()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    
    signOutButton.setTitle("Log Out", for: .normal)
    signOutButton.frame = CGRect(x: 16, y: 0, width: self.view.bounds.width - 32, height: 48)
    signOutButton.setTitleColor(.white, for: .normal)
    signOutButton.backgroundColor = .systemBlue
    signOutButton.addTarget(self, action: #selector(handleLogOutPressed), for: .touchUpInside)
    signOutButton.center = self.view.center
    signOutButton.setOutline(cornerRadius: 8, borderWidth: 1, borderColor: signOutButton.backgroundColor!.cgColor)
    
    self.view.addSubview(signOutButton)
  }
  
  @objc func handleLogOutPressed(sender: UIButton!) {
    print("log  out")
    
    let loginVC = LoginViewController()
    let authNavigation = UINavigationController(rootViewController: loginVC)
    (UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate)?.changeRootViewController(authNavigation)
  }
  
}
