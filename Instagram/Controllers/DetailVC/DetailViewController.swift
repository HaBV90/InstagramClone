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
    
    label.frame = CGRect(x: 0, y: 0, width: 200, height: 48)
    label.center = self.view.center
    label.textAlignment = .center
    label.text = "Detail Screen"
    label.textColor = .systemBlue
    
    self.view.addSubview(label)
    
    self.navigationItem.hidesBackButton = true
    self.navigationItem.leftBarButtonItem = UIBarButtonItem(
      title: "Back",
      style: .plain,
      target: self,
      action: #selector(backToVC)
    )
    navigationItem.leftBarButtonItem?.tintColor = .red
  }
  @objc func backToVC() {
    self.navigationController?.backToVC(vc: HomeViewController.self)
  }
  
}
