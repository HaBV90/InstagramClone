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
  private let refreshControl = UIRefreshControl()
  let auth = AuthenticationModel.shared
  
  private var postViewModel: PostViewModel!
  var imageDownloader = ImageDownloader()
  
  var posts: [Post] = []
  
  private func initTableView() {
    tableView.insetsLayoutMarginsFromSafeArea = false
    tableView.register(UINib(nibName: "PostTableViewCell", bundle: nil), forCellReuseIdentifier: "PostCell")
    tableView.register(UINib(nibName: "LoadingCell", bundle: nil), forCellReuseIdentifier: "LoadingCell")
    
    tableView.refreshControl = refreshControl
    refreshControl.tintColor = .red
    tableView.refreshControl?.addTarget(self, action: #selector(pullToRefresh), for: .valueChanged)
    
    tableView.dataSource = self
    tableView.delegate = self
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    self.navigationController?.navigationBar.isHidden = true
    initTableView()
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
    LoadingController.shared.showSpinner(onView: super.view)
    self.postViewModel = PostViewModel()
    self.postViewModel.bindPostViewModelToController = {
      LoadingController.shared.removeSpinner()
      self.updateDataSource()
    }
    
  }
  
  @objc func pullToRefresh() {
    print("Pull To Refresh")
    postViewModel.clearTableView()
    self.postViewModel = PostViewModel()
    self.tableView.refreshControl?.endRefreshing()
    self.postViewModel.bindPostViewModelToController = {
      self.updateDataSource()
    }
  }
  
  func updateDataSource() {
    print("Posts data -> \(posts)")
    self.posts = self.postViewModel.postsData
    self.tableView.reloadData()
  }
  
}

extension HomeViewController: UITableViewDataSource {
  func numberOfSections(in tableView: UITableView) -> Int {
    return 2
  }
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    switch section {
      // Return the amount of items
    case 0:
      return posts.count
      // Return the Loading cell
    case 1:
      return 1
      // Return Nothing
    default:
      return 0
    }
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
    if indexPath.section == 0 {
      let post = self.posts[indexPath.row]
      let cell = tableView.dequeueReusableCell(withIdentifier: "PostCell", for: indexPath) as! PostTableViewCell
      cell.tag = Int(post.id)!
      cell.userLabel.text = post.name
      //      cell.avatarImage.imageFromURL(urlString: post.avatar)
      //      cell.coverImage.imageFromURL(urlString: post.coverImage)
      imageDownloader.obtainImageWithPath(onView: cell.avatarImage, imagePath: post.avatar) { (image) in
        cell.avatarImage.image = image
      }
      imageDownloader.obtainImageWithPath(onView: cell.coverImage, imagePath: post.coverImage) { (image) in
        cell.coverImage.image = image
      }
      return cell
    } else {
      let cell = tableView.dequeueReusableCell(withIdentifier: "LoadingCell", for: indexPath) as! LoadingCell
      cell.activityIndicator.startAnimating()
      return cell
    }
  }
}

extension HomeViewController: UITableViewDelegate {
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
  }
}

extension HomeViewController: UIScrollViewDelegate {
  
  func scrollViewDidScroll(_ scrollView: UIScrollView) {
    //    if scrollView.contentOffset.y < 0 {
    //      print("scrollView.contentOffset.y < 0")
    //    } else if scrollView.contentOffset.y > 0  {
    //      print("scrollView.contentOffset.y > 0")
    //    }
  }
  
  func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
    print("scrollViewDidEndDragging")
  }
  
  func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
    print("scrollViewDidEndDecelerating")
  }
}
