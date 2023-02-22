//
//  NotificationsViewController.swift
//  Instagram
//
//  Created by HaBV on 31/01/2023.
//

import UIKit

let HEIGHT_HEADER: CGFloat = 60
let MAX_HEIGHT_HEADER: CGFloat = 160

class NotificationsViewController: UIViewController {
  
  @IBOutlet weak var notificationsTableView: UITableView!
  @IBOutlet weak var headerView: CustomHeaderView!
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
    Notification(avatar: "person", data: "Test Notification 1", follow: false, read: false),
    Notification(avatar: "house", data: "Test Notification 2", follow: true, read: false),
    Notification(avatar: "person", data: "Test Notification 3", follow: false, read: false),
    Notification(avatar: "play", data: "Test Notification 4", follow: false, read: false),
    Notification(avatar: "person", data: "Test Notification 5", follow: false, read: false),
    Notification(avatar: "person", data: "Test Notification 6", follow: false, read: false),
    Notification(avatar: "person", data: "Test Notification 7", follow: false, read: false),
    Notification(avatar: "music.note", data: "Test Notification 8", follow: true, read: false),
    Notification(avatar: "person", data: "Test Notification 9", follow: false, read: false),
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
    
    setupHeader()
    
    notificationsTableView.dataSource = self
    notificationsTableView.delegate = self
    notificationsTableView.register(UINib(nibName: "NotificationCell", bundle: nil), forCellReuseIdentifier: "ReusableNotification")
    notificationsTableView.estimatedRowHeight = 60
    notificationsTableView.rowHeight = UITableView.automaticDimension
    notificationsTableView.layoutIfNeeded()
    notificationsTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16).isActive = true
    notificationsTableView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: 16).isActive = true
  }
  
  func setupHeader() {
    headerView.configuration(with: CustomHeaderViewModel(title: "Sticky Header", iconName: "person", titleColor: UIColor.red, bgColor: .systemTeal))
    headerView.translatesAutoresizingMaskIntoConstraints = false
    self.headerHeightConstraint = headerView.heightAnchor.constraint(equalToConstant: MAX_HEIGHT_HEADER)
    headerHeightConstraint.isActive = true
  }
  
  func animateHeader() {
    self.headerHeightConstraint.constant = MAX_HEIGHT_HEADER
    UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.5, options: .curveEaseInOut, animations: {
      self.notificationsTableView.layoutIfNeeded()
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
  
  //  func numberOfSections(in tableView: UITableView) -> Int {
  //    return 2
  //
  //  }
  //
  //  func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
  //    print("section heightForHeaderInSection -> \(section)")
  //    return 54
  //  }
  //
  //  func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
  //    print("section viewForHeaderInSection -> \(section)")
  //
  //    let headerView = UIView(frame: CGRect(x: 0, y: 0, width: self.view.frame.width, height: 54))
  //    headerView.backgroundColor = .systemTeal
  //    let label = UILabel()
  //    label.frame = CGRect(x: 0, y: 0, width: 200, height: 48)
  //    label.center = headerView.center
  //    label.textAlignment = .center
  //
  //    label.textColor = .white
  //    headerView.addSubview(label)
  //
  //    if section == 0 {
  //      label.text = "Header 1"
  //    } else {
  //      label.text = "Header 2"
  //    }
  //    return headerView
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
      headerView.backgroundColor = .blue
      
      //      self.headerView.heightAnchor.constraint(equalToConstant: HEIGHT_HEADER).isActive = true
      self.headerHeightConstraint.constant += abs(scrollView.contentOffset.y)
    } else if scrollView.contentOffset.y > 0 && self.headerHeightConstraint.constant >= HEIGHT_HEADER {
      self.headerHeightConstraint.constant -= scrollView.contentOffset.y / 50
      headerView.backgroundColor = .green
      
      if self.headerHeightConstraint.constant < HEIGHT_HEADER {
        self.headerHeightConstraint.constant = HEIGHT_HEADER
        headerView.backgroundColor = .red
      }
    }
  }
  
  func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
    if self.headerHeightConstraint.constant > MAX_HEIGHT_HEADER {
      animateHeader()
    }
  }
  
  func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
    if self.headerHeightConstraint.constant > MAX_HEIGHT_HEADER {
      animateHeader()
    }
  }
}
