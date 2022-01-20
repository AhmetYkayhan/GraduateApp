//
//  BaseView.swift
//  MovieReviewApp
//
//  Created by Ahmet Yasin Kayhan on 9.01.2022.
//

import UIKit
@IBDesignable
class BaseView: UIView {

   
        @IBInspectable var cornerRadius: CGFloat = 0.0 {
            didSet {
                self.layer.cornerRadius = cornerRadius
            }
        }
        @IBInspectable var borderColor: UIColor = UIColor.white{
            didSet {
                self.layer.borderColor = borderColor.cgColor
            }
        }
    
    
    
   
    
    
        @IBInspectable var borderWith: CGFloat = 0.0 {
            didSet {
                self.layer.borderWidth = borderWith
            }
        }
    }


