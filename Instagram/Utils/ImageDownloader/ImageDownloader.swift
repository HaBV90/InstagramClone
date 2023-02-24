//
//  ImageDownloader.swift
//  Instagram
//
//  Created by HaBV on 24/02/2023.
//

import Foundation
import UIKit

class ImageDownloader {
  
  var session: URLSession!
  var cache: NSCache<NSString, UIImage>!
  
  var spinnerView = UIView()
  
  init() {
    session = URLSession.shared
    self.cache = NSCache()
  }
  
  func obtainImageWithPath(onView: UIImageView, imagePath: String, completionHandler: @escaping (UIImage) -> ()) {
    print("width view image downloader -> \(onView.frame.width)")
    print("height view image downloader -> \(onView.frame.height)")
    
    if let image = self.cache.object(forKey: imagePath as NSString) {
      DispatchQueue.main.async {
        completionHandler(image)
      }
    } else {
      let placeholder = #imageLiteral(resourceName: "keyboard")
      DispatchQueue.main.async {
        completionHandler(placeholder)
      }
      let url: URL! = URL(string: imagePath)
      
      let activityIndicator = UIActivityIndicatorView()
      spinnerView.frame = onView.bounds
      spinnerView.backgroundColor = UIColor.black.withAlphaComponent(0.3)
      
      activityIndicator.translatesAutoresizingMaskIntoConstraints = false
      activityIndicator.color = .red
      activityIndicator.frame = CGRect(x: 0, y: 0, width: onView.frame.width, height: onView.frame.height)
      activityIndicator.center = onView.center
      activityIndicator.startAnimating()
      
      spinnerView.addSubview(activityIndicator)
      onView.addSubview(spinnerView)
      
      session.downloadTask(with: url, completionHandler: { (location, response, error) in
        if let data = try? Data(contentsOf: url) {
          let img: UIImage! = UIImage(data: data)
          self.cache.setObject(img, forKey: imagePath as NSString)
          //          DispatchQueue.main.async {
          //            activityIndicator.removeFromSuperview()
          //            completionHandler(img)
          //          }
          DispatchQueue.main.asyncAfter(deadline: .now() + 20, execute: { () -> Void in
            self.spinnerView.removeFromSuperview()
            activityIndicator.removeFromSuperview()
            
            completionHandler(img)
          })
        }
      }).resume()
    }
  }
}
