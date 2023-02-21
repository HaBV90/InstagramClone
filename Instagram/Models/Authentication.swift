//
//  Authentication.swift
//  Instagram
//
//  Created by HaBV on 20/02/2023.
//

import Foundation

final class AuthenticationModel {
  static let shared = AuthenticationModel()
  private var isLogged: Bool = false
  
  // initialize
  private init() {}
  
  // isLogged set method
  var isAuthentication: Bool {
    get {
      return self.isLogged
    }
    set {
      self.isLogged = newValue
    }
  }
  
}
