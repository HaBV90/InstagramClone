//
//  HomeViewController.swift
//  Instagram
//
//  Created by HaBV on 31/01/2023.
//

import UIKit
import FirebaseAuth

class HomeViewController: UIViewController {
  
  @IBOutlet weak var tableView: UITableView!
  let auth = AuthenticationModel.shared
  
  private var postViewModel: PostViewModel!
  
  var posts: [Post] = []
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
//    let button = UIButton()
//    let logOutButton = UIButton()
//    let label = UILabel()
//    
//    label.frame = CGRect(x: 0, y: 0, width: 200, height: 48)
//    label.center = self.view.center
//    label.textAlignment = .center
//    label.text = "HomeScreen"
//    label.textColor = .systemBlue
//    
//    button.setTitle("Demo Button", for: .normal)
//    button.frame = CGRect(x: 0, y: 0, width: 200, height: 48)
//    button.setTitleColor(.white, for: .normal)
//    button.backgroundColor = .systemBlue
//    button.addTarget(self, action: #selector(handlePressed), for: .touchUpInside)
//    button.layer.cornerRadius = 8
//    button.center = CGPointMake(label.center.x, label.center.y + label.frame.size.height)
//    
//    logOutButton.setTitle("Log Out", for: .normal)
//    logOutButton.frame = CGRect(x: 0, y: 0, width: 200, height: 48)
//    logOutButton.setTitleColor(.white, for: .normal)
//    logOutButton.backgroundColor = .systemBlue
//    logOutButton.addTarget(self, action: #selector(handleLogOut), for: .touchUpInside)
//    logOutButton.layer.cornerRadius = 8
//    logOutButton.center = CGPointMake(label.center.x, label.center.y + label.frame.size.height + button.frame.size.height + 16)
//    
//    self.view.addSubview(label)
//    self.view.addSubview(button)
//    self.view.addSubview(logOutButton)
    
    tableView.dataSource = self
    tableView.delegate = self
    tableView.register(UINib(nibName: "PostTableViewCell", bundle: nil), forCellReuseIdentifier: "Post Table View Cell")
    tableView.layoutIfNeeded()
    tableView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 16).isActive = true
    tableView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: 16).isActive = true
    tableView.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 16).isActive = true
    tableView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
    
    callToViewModelForUIUpdate()
  }
  
  @objc func handlePressed(sender: UIButton!) {
    let homeDetailVC = HomeDetailViewController()
    homeDetailVC.navigationController?.navigationBar.backgroundColor = .white
    navigationController?.pushViewController(homeDetailVC, animated: true)
  }
  
  @objc func handleLogOut(_ sender: UIButton) {
    self.showSpinner(onView: self.view)
    do {
      try Auth.auth().signOut()
      self.removeSpinner()
      self.auth.isAuthentication = false
      let loginVC = LoginViewController()
      let authNavigation = UINavigationController(rootViewController: loginVC)
      (UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate)?.changeRootViewController(authNavigation)
    } catch let signOutError as NSError {
      print("Error signing out: %@", signOutError)
    }
  }
  
  func callToViewModelForUIUpdate() {
    self.showSpinner(onView: self.view)
    self.postViewModel = PostViewModel()
    self.removeSpinner()
    self.postViewModel.bindPostViewModelToController = {
      self.posts = self.postViewModel.postsData
      self.updateDataSource()
    }
    
  }
  
  func updateDataSource() {
  }
  
}

extension HomeViewController: UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return posts.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let post = self.postViewModel.postsData[indexPath.row]
    let cell = tableView.dequeueReusableCell(withIdentifier: "Post Table View Cell", for: indexPath) as! PostTableViewCell
    
    
    cell.userLabel.text = post.name
    cell.avatarImage.image = UIImage(systemName: "person")
    cell.coverImage.image = UIImage(systemName: "person")
    return cell
  }
  
}

extension HomeViewController: UITableViewDelegate {
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    let cell = tableView.cellForRow(at: indexPath) as! NotificationCell
    if let titleText = cell.contentLabel.text {
      print("content cell -> \(titleText)")
    }
  }
}
