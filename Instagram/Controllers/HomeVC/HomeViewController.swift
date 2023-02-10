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
    
    var image = UIImageView()
    
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
    
    image = UIImageView(frame: CGRect(x: 0, y: 0, width: 64, height: 64))
    image.center = CGPointMake(label.center.x, label.center.y - label.frame.size.height)
    image.image = UIImage(systemName: "lock")
    image.layer.cornerRadius = 8
    image.layer.borderWidth = 2
    image.layer.borderColor = UIColor.green.cgColor
    image.contentMode = .scaleAspectFill
    image.image = image.image?.imageWithInsets(UIEdgeInsets(top: 4, left: 4, bottom: 4, right: 4))
    //    image.image = image.image?.changeColor(UIColor.systemBlue)
    image.changeImageTintColor(UIColor.systemPink)
    
    let secondaryButton = CustomButton()
    secondaryButton.frame = CGRect(x: 0, y: 0, width: 300, height: 48)
    secondaryButton.center = CGPointMake(label.center.x, label.center.y + label.frame.size.height + button.frame.size.height + 16)
//    secondaryButton.setTitle("Secondary Button", for: .normal)
////    secondaryButton.setTitleColor(.white, for: .normal)
////    secondaryButton.backgroundColor = .systemBlue
//    secondaryButton.setImage(UIImage(systemName: "person"), for: .normal)
////    secondaryButton.tintColor = .white
////    secondaryButton.configuration?.imagePadding = 10
////    secondaryButton.configuration?.titlePadding = 10
////    secondaryButton.configuration?.contentInsets = NSDirectionalEdgeInsets(top: 8, leading: 20, bottom: 8, trailing: 20)
//    secondaryButton.setOutline(cornerRadius: 8, borderWidth: 1, borderColor: UIColor.red.cgColor)
//    secondaryButton.shadow(shadowColor: UIColor.red.cgColor, shadowOffset: CGSize(width: 0, height: 8), shadowRadius: 8, shadowOpacity: 0.6)
    secondaryButton.configuration(with: CustomButtonViewModel(title: "Secondary", iconName: "person"))
    secondaryButton.setOutline(cornerRadius: 8, borderWidth: 1, borderColor: UIColor.red.cgColor)
    
    self.view.addSubview(image)
    self.view.addSubview(label)
    self.view.addSubview(button)
    self.view.addSubview(secondaryButton)
  }
  
  
  /*
   // MARK: - Navigation
   
   // In a storyboard-based application, you will often want to do a little preparation before navigation
   override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
   // Get the new view controller using segue.destination.
   // Pass the selected object to the new view controller.
   }
   */
  @objc func handlePressed(sender: UIButton!) {
    
    let homeDetailVC = HomeDetailViewController()
    homeDetailVC.navigationController?.navigationBar.backgroundColor = .white
    
    navigationController?.pushViewController(homeDetailVC, animated: true)
  }
  
}
