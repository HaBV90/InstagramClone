//
//  Post.swift
//  Instagram
//
//  Created by HaBV on 22/02/2023.
//

import Foundation

struct Post: Decodable {
  let id: String
  let avatar: String
  let name: String
  let coverImage: String
}

struct Posts: Decodable {
  let posts: [Post]
}
