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
    self.navigationController?.navigationBar.isHidden = true
    tableView.dataSource = self
    tableView.delegate = self
    tableView.insetsLayoutMarginsFromSafeArea = false
    tableView.register(UINib(nibName: "PostTableViewCell", bundle: nil), forCellReuseIdentifier: "PostCell")
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
//    self.showSpinner(onView: self.view)
    LoadingController.shared.showSpinner(onView: super.view)
    self.postViewModel = PostViewModel()
    
    self.postViewModel.bindPostViewModelToController = {
      LoadingController.shared.removeSpinner()
      self.posts = self.postViewModel.postsData
      self.updateDataSource()
    }
    
  }
  
  func updateDataSource() {
    print("Posts data -> \(posts)")
    self.tableView.reloadData()
  }
  
}

extension HomeViewController: UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return posts.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let post = self.posts[indexPath.row]
    let cell = tableView.dequeueReusableCell(withIdentifier: "PostCell", for: indexPath) as! PostTableViewCell
    print("post item -> \(post)")
    cell.tag = Int(post.id)!
    cell.userLabel.text = post.name
    cell.avatarImage.imageFromURL(urlString: post.avatar)
    cell.coverImage.imageFromURL(urlString: post.coverImage)
    return cell
  }
  
}

extension HomeViewController: UITableViewDelegate {
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
  }
}
