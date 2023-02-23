//
//  PostViewModel.swift
//  Instagram
//
//  Created by HaBV on 22/02/2023.
//

import Foundation

class PostViewModel: NSObject {
  
  private var apiService: APIService!
  
  private(set) var postsData : [Post]! {
    didSet {
      self.bindPostViewModelToController()
    }
  }
  
  var bindPostViewModelToController : (() -> ()) = {}
  
  override init() {
    super.init()
    self.apiService = APIService()
    fetchPostsData()
  }
  
  func fetchPostsData() {
    self.apiService.getPostsData() { posts in
//      print("posts data -> \(posts)")
      self.postsData = posts
    }
  }
}
