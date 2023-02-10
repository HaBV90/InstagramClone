//
//  Image.swift
//  Instagram
//
//  Created by HaBV on 08/02/2023.
//

import UIKit

extension UIImage {
  public func imageWithInsets(_ insets: UIEdgeInsets) -> UIImage {
    let targetWidth = size.width + insets.left + insets.right
    let targetHeight = size.height + insets.top + insets.bottom
    let targetSize = CGSize(width: targetWidth, height: targetHeight)
    let targetOrigin = CGPoint(x: insets.left, y: insets.top)
    let format = UIGraphicsImageRendererFormat()
    format.scale = scale
    let renderer = UIGraphicsImageRenderer(size: targetSize, format: format)
    return renderer.image { _ in
      draw(in: CGRect(origin: targetOrigin, size: size))
    }.withRenderingMode(renderingMode)
  }
  
  public func changeColor(_ color: UIColor) -> UIImage? {
    if #available(*, iOS 13) {
      UIGraphicsBeginImageContextWithOptions(size, false, scale)
      let drawRect = CGRect(x: 0, y: 0, width: size.width, height: size.height)
      color.setFill()
      UIRectFill(drawRect)
      draw(in: drawRect, blendMode: .destinationIn, alpha: 1)
      let tintedImage = UIGraphicsGetImageFromCurrentImageContext()
      UIGraphicsEndImageContext()
      
      return tintedImage!
    } else {
      let image = withRenderingMode(.alwaysTemplate)
      UIGraphicsBeginImageContextWithOptions(size, false, scale)
      color.setFill()
      image.draw(in: CGRect(origin: .zero, size: size))
      
      guard let imageColored = UIGraphicsGetImageFromCurrentImageContext() else {
        return nil
      }
      
      UIGraphicsEndImageContext()
      return imageColored
    }
  }
}

extension  UIImageView {
  public func changeImageTintColor(_ color: UIColor) {
    let tintedImage = self.image?.withRenderingMode(.alwaysTemplate)
    self.image = tintedImage
    self.tintColor = color
  }
}
