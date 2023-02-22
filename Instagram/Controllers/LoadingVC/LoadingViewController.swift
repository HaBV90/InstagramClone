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
    // The indicator should be animating when
    // the view appears.
    indicator.startAnimating()
    // Setting the autoresizing mask to flexible for all
    // directions will keep the indicator in the center
    // of the view and properly handle rotation.
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
    // Setting the autoresizing mask to flexible for
    // width and height will ensure the blurEffectView
    // is the same size as its parent view.
    blurEffectView.autoresizingMask = [
      .flexibleWidth, .flexibleHeight
    ]
    return blurEffectView
  }()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = UIColor.black.withAlphaComponent(0.4)
    // Add the blurEffectView with the same
    // size as view
    blurEffectView.frame = self.view.bounds
    view.insertSubview(blurEffectView, at: 0)
    // Add the loadingActivityIndicator in the
    // center of view
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
      // The indicator should be animating when
      // the view appears.
      indicator.startAnimating()
      // Setting the autoresizing mask to flexible for all
      // directions will keep the indicator in the center
      // of the view and properly handle rotation.
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
      // Setting the autoresizing mask to flexible for
      // width and height will ensure the blurEffectView
      // is the same size as its parent view.
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
//    DispatchQueue.main.async {
//      self.view.removeFromSuperview()
//      self.view.willMove(toSuperview: nil)
//      self.view = nil
//    }
    print("view.subviews -> \(self.view.subviews)")
  }
  
  
}
