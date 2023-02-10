//
//  HomeViewController.swift
//  Instagram
//
//  Created by HaBV on 31/01/2023.
//

import UIKit

class HomeViewController: UIViewController {
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    let button = UIButton()
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
    
    self.view.addSubview(label)
    self.view.addSubview(button)
  }
  
  @objc func handlePressed(sender: UIButton!) {
    
    let homeDetailVC = HomeDetailViewController()
    homeDetailVC.navigationController?.navigationBar.backgroundColor = .white
    
    navigationController?.pushViewController(homeDetailVC, animated: true)
  }
  
}
