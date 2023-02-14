//
//  NotificationsViewController.swift
//  Instagram
//
//  Created by HaBV on 31/01/2023.
//

import UIKit

class NotificationsViewController: UIViewController {
  
  @IBOutlet weak var notificationsTableView: UITableView!
  var headerView: CustomHeaderView!
  var headerHeightConstraint: NSLayoutConstraint!
  
  var notifications: [Notification] = [
    Notification(avatar: "person", data: "Test Notification 1 Test Notification 1 Test Notification 1 Test Notification 1 Test Notification 1 Test Notification 1 Test Notification 1 Test Notification 1 Test Notification 1 Test Notification 1", follow: false, read: false),
    Notification(avatar: "house", data: "Test Notification 2", follow: true, read: false),
    Notification(avatar: "person", data: "Test Notification 3  Test Notification 3 Test Notification 3 Test Notification 3  ", follow: false, read: false),
    Notification(avatar: "play", data: "Test Notification 4", follow: false, read: false),
    Notification(avatar: "person", data: "Test Notification 5", follow: false, read: false),
    Notification(avatar: "person", data: "Test Notification 6", follow: false, read: false),
    Notification(avatar: "person", data: "Test Notification 7", follow: false, read: false),
    Notification(avatar: "music.note", data: "Test Notification 8", follow: true, read: false),
    Notification(avatar: "person", data: "Test Notification 9 Test Notification 9 Test Notification 9 Test Notification 9", follow: false, read: false),
    Notification(avatar: "person", data: "Test Notification 1", follow: false, read: false),
    Notification(avatar: "house", data: "Test Notification 2", follow: true, read: false),
    Notification(avatar: "person", data: "Test Notification 3", follow: false, read: false),
    Notification(avatar: "play", data: "Test Notification 4", follow: false, read: false),
    Notification(avatar: "person", data: "Test Notification 5", follow: false, read: false),
    Notification(avatar: "person", data: "Test Notification 6", follow: false, read: false),
    Notification(avatar: "person", data: "Test Notification 7", follow: false, read: false),
    Notification(avatar: "music.note", data: "Test Notification 8", follow: true, read: false),
    Notification(avatar: "person", data: "Test Notification 9", follow: false, read: false),
  ]
  
  override func viewDidLoad() {
    super.viewDidLoad()
    title = "Notifications"
    navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 24)]
    notificationsTableView.dataSource = self
    notificationsTableView.delegate = self
    notificationsTableView.register(UINib(nibName: "NotificationCell", bundle: nil), forCellReuseIdentifier: "ReusableNotification")
    notificationsTableView.estimatedRowHeight = 60
    notificationsTableView.rowHeight = UITableView.automaticDimension
    setupHeader()
  }
  
  func setupHeader() {
    headerView = CustomHeaderView()
    headerView.title = "Test Header"
    headerView.translatesAutoresizingMaskIntoConstraints = false
    view.addSubview(headerView)
    
    headerHeightConstraint = headerView.heightAnchor.constraint(equalToConstant: 150)
    headerHeightConstraint.isActive = true
    
    let constraints:[NSLayoutConstraint] = [
      headerView.topAnchor.constraint(equalTo: view.topAnchor),
      headerView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
      headerView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
    ]
    NSLayoutConstraint.activate(constraints)
  }
  func animateHeader() {
    self.headerHeightConstraint.constant = 150
    UIView.animate(withDuration: 0.4, delay: 0.0, usingSpringWithDamping: 0.7, initialSpringVelocity: 0.5, options: .curveEaseInOut, animations: {
      self.view.layoutIfNeeded()
    }, completion: nil)
  }
  
}

extension NotificationsViewController: UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return notifications.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let notification = notifications[indexPath.row]
    let cell = tableView.dequeueReusableCell(withIdentifier: "ReusableNotification", for: indexPath) as! NotificationCell
    cell.contentLabel.text = notification.content
    cell.avatarImage.image = UIImage(systemName: notification.avatarImage)
    
    if notification.requestFollow! {
      cell.followButton.isHidden = true
    } else {
      cell.followButton.isHidden = false
    }
    return cell
  }
  
  func numberOfSections(in tableView: UITableView) -> Int {
    return 1
  }
  
  //  func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
  //    return 54
  //  }
  //
  //  func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
  //    let headerView = UIView(frame: CGRect(x: 0, y: 0, width: self.view.frame.width, height: 54))
  //    headerView.backgroundColor = .systemTeal
  //    let label = UILabel()
  //    label.frame = CGRect(x: 0, y: 0, width: 200, height: 48)
  //    label.center = headerView.center
  //    label.textAlignment = .center
  //    label.text = "Header Test"
  //    label.textColor = .white
  //    headerView.addSubview(label)
  //    return headerView
  //  }
  //
  //  func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
  //    return 54
  //  }
  
  //  func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
  //    let footerView = UIView(frame: CGRect(x: 0, y: 0, width: self.view.frame.width, height: 54))
  //    footerView.backgroundColor = .systemGreen
  //    let label = UILabel()
  //    label.frame = CGRect(x: 0, y: 0, width: 200, height: 48)
  //    label.center = footerView.center
  //    label.textAlignment = .center
  //    label.text = "Footer Test"
  //    label.textColor = .white
  //    footerView.addSubview(label)
  //    return footerView
  //  }
}

extension NotificationsViewController: UITableViewDelegate {
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    let cell = tableView.cellForRow(at: indexPath) as! NotificationCell
    if let titleText = cell.contentLabel.text {
      print("content cell -> \(titleText)")
    }
  }
}
extension NotificationsViewController: UIScrollViewDelegate {
  
  func scrollViewDidScroll(_ scrollView: UIScrollView) {
    if scrollView.contentOffset.y < 0 {
      self.headerHeightConstraint.constant += abs(scrollView.contentOffset.y)
      headerView.incrementColorAlpha(offset: self.headerHeightConstraint.constant)
      headerView.incrementArticleAlpha(offset: self.headerHeightConstraint.constant)
    } else if scrollView.contentOffset.y > 0 && self.headerHeightConstraint.constant >= 65 {
      self.headerHeightConstraint.constant -= scrollView.contentOffset.y/100
      headerView.decrementColorAlpha(offset: scrollView.contentOffset.y)
      headerView.decrementArticleAlpha(offset: self.headerHeightConstraint.constant)
      
      if self.headerHeightConstraint.constant < 65 {
        self.headerHeightConstraint.constant = 65
      }
    }
  }
  
  func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
    if self.headerHeightConstraint.constant > 150 {
      animateHeader()
    }
  }
  
  func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
    if self.headerHeightConstraint.constant > 150 {
      animateHeader()
    }
  }
}
