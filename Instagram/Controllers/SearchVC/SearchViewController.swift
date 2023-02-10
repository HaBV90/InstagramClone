//
//  SearchViewController.swift
//  Instagram
//
//  Created by HaBV on 31/01/2023.
//

import UIKit

class SearchViewController: UIViewController {
  
  override func viewDidLoad() {
    super.viewDidLoad()
    let label = UILabel()
    
    label.frame = CGRect(x: 0, y: 0, width: 200, height: 24)
    label.center = self.view.center
    label.textAlignment = .center
    label.text = "Search Screen"
    label.textColor = .systemBlue
    
    self.view.addSubview(label)
  }
  
  
  /*
   // MARK: - Navigation
   
   // In a storyboard-based application, you will often want to do a little preparation before navigation
   override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
   // Get the new view controller using segue.destination.
   // Pass the selected object to the new view controller.
   }
   */
  
}
