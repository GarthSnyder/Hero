//
//  SaveImage.swift
//  Hero (iOS)
//
//  Created by garth on 6/7/18.
//  Copyright © 2018 Luke Zhao. All rights reserved.
//

import UIKit

extension UIView {
  
  static var imageNumber = 0
  
  func saveImage() {
    let image = convertToUIImage()
    let documentsURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
    // let baseDirURL = documentsURL.appendingPathComponent("HeroSnapshots")
    if let data = UIImagePNGRepresentation(image) {
        let filename = documentsURL.appendingPathComponent("\(UIView.imageNumber).png")
        UIView.imageNumber += 1
        try! data.write(to: filename)
    }
  }
    
  func convertToUIImage() -> UIImage {
      UIGraphicsBeginImageContext(frame.size)
      drawHierarchy(in: bounds, afterScreenUpdates: true)
      let image = UIGraphicsGetImageFromCurrentImageContext()
      UIGraphicsEndImageContext()
      return image!
  }
  
}
