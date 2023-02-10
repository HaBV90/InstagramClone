//
//  Notification.swift
//  Instagram
//
//  Created by HaBV on 01/02/2023.
//

import Foundation

struct Notification {
  let avatarImage: String
  let content: String
  let requestFollow: Bool?
  let isRead: Bool
  
  init(avatar: String, data: String, follow: Bool, read: Bool) {
    avatarImage = avatar
    content = data
    requestFollow = follow
    isRead = read
  }
  
}
