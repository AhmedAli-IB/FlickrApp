//
//  UIView+Helpers.swift
//  FlickrApp
//
//  Created by Ahmed Ali on 10/01/2021.
//
import UIKit

/// UIView Class Methods
///
extension UIView {
  
  /// Returns the Nib associated with the received: It's filename is expected to match the Class Name
  ///
  class func loadNib() -> UINib {
    return UINib(nibName: classNameWithoutNamespaces, bundle: nil)
  }
}
