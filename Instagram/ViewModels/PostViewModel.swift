//
//  PostViewModel.swift
//  Instagram
//
//  Created by HaBV on 22/02/2023.
//

import Foundation

class PostViewModel: NSObject {
  
  private var apiService: APIService!
  private var page: Int = 0
  private var size: Int = 10
  private var loadMore: Bool = true
  
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
      self.postsData = posts
    }
  }
  
  /// Clear tableview data source
  func clearTableView() {
    self.page = 0
  }
  
}
