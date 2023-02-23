//
//  LoadingViewController.swift
//  Instagram
//
//  Created by HaBV on 16/02/2023.
//

import UIKit


class LoadingViewController: UIViewController {
  
  var loadingActivityIndicator: UIActivityIndicatorView = {
    let indicator = UIActivityIndicatorView()
    indicator.style = .large
    indicator.color = .white
    indicator.startAnimating()
    indicator.autoresizingMask = [
      .flexibleLeftMargin, .flexibleRightMargin,
      .flexibleTopMargin, .flexibleBottomMargin
    ]
    return indicator
  }()
  
  var blurEffectView: UIVisualEffectView = {
    let blurEffect = UIBlurEffect(style: .light)
    let blurEffectView = UIVisualEffectView(effect: blurEffect)
    blurEffectView.alpha = 0.1
    blurEffectView.autoresizingMask = [
      .flexibleWidth, .flexibleHeight
    ]
    return blurEffectView
  }()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = UIColor.black.withAlphaComponent(0.4)
    blurEffectView.frame = self.view.bounds
    view.insertSubview(blurEffectView, at: 0)
    loadingActivityIndicator.center = CGPoint(
      x: view.bounds.midX,
      y: view.bounds.midY
    )
    view.addSubview(loadingActivityIndicator)
  }
}

extension UIViewController {
  func showSpinner(onView: UIView) {
    let loadingActivityIndicator: UIActivityIndicatorView = {
      let indicator = UIActivityIndicatorView()
      indicator.style = .large
      indicator.color = .red
      indicator.startAnimating()
      indicator.autoresizingMask = [
        .flexibleLeftMargin, .flexibleRightMargin,
        .flexibleTopMargin, .flexibleBottomMargin
      ]
      return indicator
    }()
    
    let blurEffectView: UIVisualEffectView = {
      let blurEffect = UIBlurEffect(style: .light)
      let blurEffectView = UIVisualEffectView(effect: blurEffect)
      blurEffectView.alpha = 0.3
      blurEffectView.autoresizingMask = [
        .flexibleWidth, .flexibleHeight
      ]
      return blurEffectView
    }()
    
    let spinnerView = UIView.init(frame: onView.bounds)
    spinnerView.backgroundColor = UIColor.black.withAlphaComponent(0.3)
    blurEffectView.frame = self.view.bounds
    
    DispatchQueue.main.async {
      loadingActivityIndicator.center = self.view.center
      spinnerView.insertSubview(blurEffectView, at: 0)
      spinnerView.addSubview(loadingActivityIndicator)
      onView.addSubview(spinnerView)
    }
    self.view.addSubview(spinnerView)
  }
  
  func removeSpinner() {
    DispatchQueue.main.async {
      //      self.view.removeFromSuperview()
      //      self.view.willMove(toSuperview: nil)
      //      self.view = nil
    }
  }
}

public class LoadingController{
  
  var spinnerView = UIView()
  var activityIndicator = UIActivityIndicatorView()
  var blurEffectView: UIVisualEffectView = {
    let blurEffect = UIBlurEffect(style: .light)
    let blurEffectView = UIVisualEffectView(effect: blurEffect)
    blurEffectView.alpha = 0.3
    blurEffectView.autoresizingMask = [
      .flexibleWidth, .flexibleHeight
    ]
    return blurEffectView
  }()
  
  class var shared: LoadingController {
    struct Static {
      static let instance: LoadingController = LoadingController()
    }
    return Static.instance
  }
  
  public func showSpinner(onView: UIView) {
    spinnerView.frame = onView.bounds
    spinnerView.backgroundColor = UIColor.black.withAlphaComponent(0.3)
    
    activityIndicator.style = .large
    activityIndicator.color = .red
    activityIndicator.startAnimating()
    activityIndicator.autoresizingMask = [
      .flexibleLeftMargin, .flexibleRightMargin,
      .flexibleTopMargin, .flexibleBottomMargin
    ]
    activityIndicator.center = onView.center
    
    spinnerView.insertSubview(blurEffectView, at: 0)
    spinnerView.addSubview(activityIndicator)
    onView.addSubview(spinnerView)
  }
  public func removeSpinner() {
    spinnerView.removeFromSuperview()
  }
}
