//
//  APIService.swift
//  Instagram
//
//  Created by HaBV on 22/02/2023.
//

import Foundation

class APIService :  NSObject {
  
  private let sourcesURL = URL(string: "https://63f5866c55677ef68bcf3d82.mockapi.io/api/")!
  
  func getPostsData(completion : @escaping ([Post]) -> ()){
    if let url = URL(string: "https://63f5866c55677ef68bcf3d82.mockapi.io/api/posts") {
      let  session = URLSession(configuration: .default)
      let task = session.dataTask(with: url) {
        (data, response, error) in
        if error == nil {
          let decoder = JSONDecoder()
          if let safeData = data {
            do {
              let results = try decoder.decode([Post].self, from: safeData)
              //              print("results -> \(results)")
              DispatchQueue.main.async {
                completion(results)
              }
              
            } catch {
              print("Error \(error)")
            }
          }
        }
      }
      task.resume()
    }
  }
}
