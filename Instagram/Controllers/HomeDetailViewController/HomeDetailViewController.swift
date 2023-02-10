//
//  HomeDetailViewController.swift
//  Instagram
//
//  Created by HaBV on 31/01/2023.
//

import UIKit

class HomeDetailViewController: UIViewController {
  
  let navigationAppearance = UINavigationBarAppearance()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    let label = UILabel()
    let button = UIButton()
    label.frame = CGRect(x: 0, y: 0, width: 200, height: 48)
    label.center = self.view.center
    label.textAlignment = .center
    label.text = "Detail Screen"
    label.textColor = .systemBlue
    self.view.addSubview(label)
    
    button.setTitle("Push to Detail Screen", for: .normal)
    button.frame = CGRect(x: 0, y: 0, width: 200, height: 48)
    button.setTitleColor(.white, for: .normal)
    button.backgroundColor = .systemBlue
    button.addTarget(self, action: #selector(handlePressed), for: .touchUpInside)
    button.layer.cornerRadius = 8
    button.center = CGPointMake(label.center.x, label.center.y + label.frame.size.height)
    self.view.addSubview(button)
    
    // Change Background navigation bar
    navigationAppearance.configureWithDefaultBackground()
    navigationAppearance.backgroundColor = .systemBackground
    self.navigationItem.standardAppearance = navigationAppearance
    self.navigationItem.compactAppearance = navigationAppearance
    self.navigationItem.scrollEdgeAppearance = navigationAppearance
    // Set title text
    self.title = "Home Detail Screen"
    navigationItem.backButtonTitle = ""
    // customize right button
    navigationItem.rightBarButtonItem = UIBarButtonItem(
      image: UIImage(systemName: "trash"),
      style: .plain,
      target: self,
      action: #selector(pressedRightButton)
    )

    navigationItem.rightBarButtonItem?.tintColor = .red
  }
  
  @objc private func pressedRightButton() {
    
  }
  
  @objc func handlePressed() {
    let DetailVC = DetailViewController()
    DetailVC.navigationController?.navigationBar.backgroundColor = .white
    
    navigationController?.pushViewController(DetailVC, animated: true)
  }
  
  @objc private func popToPrevious() {
    // our custom stuff
    navigationController?.popViewController(animated: true)
  }
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
  }
}
