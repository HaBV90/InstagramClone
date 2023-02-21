//
//  HomeViewController.swift
//  Instagram
//
//  Created by HaBV on 31/01/2023.
//

import UIKit

class HomeViewController: UIViewController {
  
  let auth = AuthenticationModel.shared
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    let button = UIButton()
    let logOutButton = UIButton()
    let label = UILabel()
    
    label.frame = CGRect(x: 0, y: 0, width: 200, height: 48)
    label.center = self.view.center
    label.textAlignment = .center
    label.text = "HomeScreen"
    label.textColor = .systemBlue
    
    button.setTitle("Demo Button", for: .normal)
    button.frame = CGRect(x: 0, y: 0, width: 200, height: 48)
    button.setTitleColor(.white, for: .normal)
    button.backgroundColor = .systemBlue
    button.addTarget(self, action: #selector(handlePressed), for: .touchUpInside)
    button.layer.cornerRadius = 8
    button.center = CGPointMake(label.center.x, label.center.y + label.frame.size.height)
    
    logOutButton.setTitle("Log Out", for: .normal)
    logOutButton.frame = CGRect(x: 0, y: 0, width: 200, height: 48)
    logOutButton.setTitleColor(.white, for: .normal)
    logOutButton.backgroundColor = .systemBlue
    logOutButton.addTarget(self, action: #selector(handleLogOut), for: .touchUpInside)
    logOutButton.layer.cornerRadius = 8
    logOutButton.center = CGPointMake(label.center.x, label.center.y + label.frame.size.height + button.frame.size.height + 16)
    
    self.view.addSubview(label)
    self.view.addSubview(button)
    self.view.addSubview(logOutButton)
  }
  
  @objc func handlePressed(sender: UIButton!) {
    let homeDetailVC = HomeDetailViewController()
    homeDetailVC.navigationController?.navigationBar.backgroundColor = .white
    navigationController?.pushViewController(homeDetailVC, animated: true)
  }
  
  @objc func handleLogOut(_ sender: UIButton) {
    self.auth.isAuthentication = false
    let loginVC = LoginViewController()
    let authNavigation = UINavigationController(rootViewController: loginVC)
    (UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate)?.changeRootViewController(authNavigation)
  }
  
}
