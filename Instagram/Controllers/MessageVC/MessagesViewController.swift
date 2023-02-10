//
//  MessagesViewController.swift
//  Instagram
//
//  Created by HaBV on 31/01/2023.
//

import UIKit

class MessagesViewController: UIViewController {
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    let label = UILabel(frame: CGRect(x: 0, y: 0, width: 200, height: 21))
    label.center = CGPoint(x: self.view.frame.size.width / 2, y: self.view.frame.size.height / 2)
    label.textAlignment = .center
    label.text = "Messages Screen"
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
