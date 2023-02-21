//
//  TabBarViewController.swift
//  Instagram
//
//  Created by HaBV on 31/01/2023.
//

import UIKit

class TabBarViewController: UITabBarController {
  let auth = AuthenticationModel.shared
  
  override func viewDidLoad() {
    super.viewDidLoad()
    self.delegate = self
    let homeVC = createTabBarItem(tabBarTitle: "Home", tabBarImage: "house.fill", viewController: HomeViewController(), tabBarTag: 0)
    let searchVC = createTabBarItem(tabBarTitle: "Search", tabBarImage: "magnifyingglass", viewController: SearchViewController(), tabBarTag: 0)
    let messagesVC = createTabBarItem(tabBarTitle: "Messages", tabBarImage: "message", viewController: MessagesViewController(), tabBarTag: 2)
    let notificationsVC = createTabBarItem(tabBarTitle: "Notifications", tabBarImage: "bell.fill", viewController: NotificationsViewController(), tabBarTag: 3)
    let profileVC = createTabBarItem(tabBarTitle: "Profile", tabBarImage: "person.circle", viewController: ProfileViewController(), tabBarTag: 4)

    let mainVC = [homeVC, searchVC, messagesVC, notificationsVC, profileVC]
    let skipVC = [homeVC, searchVC, notificationsVC]
    
    configurationTabBar()
    
    let isLogged = auth.isAuthentication
    
    viewControllers = isLogged ? mainVC : skipVC
  }
  
  func configurationTabBar() {
    tabBar.backgroundColor = .white
    tabBar.tintColor = .systemBlue
    tabBar.unselectedItemTintColor = .systemGray
    tabBar.isTranslucent = true
    tabBar.selectedItem?.setTitleTextAttributes([NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 20)], for: .normal)
  }
  
  func createTabBarItem(tabBarTitle: String, tabBarImage: String, viewController: UIViewController, tabBarTag: Int) -> UINavigationController {
    let navCont = UINavigationController(rootViewController: viewController)
    navCont.tabBarItem.title = tabBarTitle
    navCont.tabBarItem.image = UIImage(systemName: tabBarImage)
    navCont.tabBarItem.tag = tabBarTag
    // Nav Bar Customisation
    navCont.navigationBar.barTintColor = .white
    navCont.navigationBar.tintColor = .systemBlue
    navCont.navigationBar.isTranslucent = true
    
    if(tabBarTitle == "Notifications") {
      navCont.tabBarItem.badgeValue = "99"
      navCont.tabBarItem.badgeColor = .systemRed
    }
    return navCont
  }
}

extension TabBarViewController: UITabBarControllerDelegate {
  func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
    if let tabBarTitle = tabBarController.tabBar.selectedItem?.title {
      print("Selected Tab : \(tabBarTitle)")
    }
  }
  
  func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {
    return true
  }

}
