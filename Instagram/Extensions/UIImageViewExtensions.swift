//
//  UIImageView.swift
//  Instagram
//
//  Created by HaBV on 23/02/2023.
//

import Foundation
import UIKit

extension UIImageView {
  public func imageFromURL(urlString: String) {
    
    let activityIndicator = UIActivityIndicatorView()
    activityIndicator.color = .red
    activityIndicator.frame = CGRect.init(x: 0, y: 0, width: 24, height: 24)
    activityIndicator.translatesAutoresizingMaskIntoConstraints = false
    activityIndicator.startAnimating()
    if self.image == nil{
      self.addSubview(activityIndicator)
    }
    
    URLSession.shared.dataTask(with: NSURL(string: urlString)! as URL, completionHandler: {
      (data, response, error) -> Void in
      if error != nil {
        print(error ?? "No Error")
        return
      }
      DispatchQueue.main.async(execute: { () -> Void in
        let image = UIImage(data: data!)
        activityIndicator.removeFromSuperview()
        self.image = image
      })
      
      //      DispatchQueue.main.asyncAfter(deadline: .now() + 30, execute: { () -> Void in
      //        let image = UIImage(data: data!)
      //        activityIndicator.removeFromSuperview()
      //        self.image = image
      //      })
      
    }).resume()
  }
  
//  public func shadow(shadowColor: CGColor, shadowOffset: CGSize, shadowRadius: Double, shadowOpacity: Float) {
//    layer.shadowColor   = shadowColor
//    layer.shadowOffset  = shadowOffset
//    layer.shadowRadius  = shadowRadius
//    layer.shadowOpacity = shadowOpacity
//    clipsToBounds       = true
//    layer.masksToBounds = false
//  }
//  
//  public func setOutline(cornerRadius: Double, borderWidth: Double, borderColor: CGColor) {
//    layer.cornerRadius = cornerRadius
//    layer.borderWidth = borderWidth
//    layer.borderColor = borderColor
//    layer.masksToBounds = true
//  }
}
