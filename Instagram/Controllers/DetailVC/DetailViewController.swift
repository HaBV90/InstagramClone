//
//  DetailViewController.swift
//  Instagram
//
//  Created by HaBV on 07/02/2023.
//

import UIKit

class DetailViewController: UIViewController {
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    let label = UILabel()
    
//    label.frame = CGRect(x: 0, y: 0, width: 200, height: 48)
//    label.textAlignment = .center
//    label.center = self.view.center
//    label.text = "Detail Screen"
//    label.textColor = .systemBlue
//    label.backgroundColor = .cyan
    
    self.view.addSubview(label)
  }
  
  @objc func backToVC() {
    self.navigationController?.backToVC(vc: HomeViewController.self)
  }
  
}
