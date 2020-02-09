//
//  RoundView.swift
//  Quizzler
//
//  Created by Hady Hammad on 10/25/19.
//  Copyright © 2019 Hady Hammad. All rights reserved.
//

import UIKit
class RoundView:UIView{
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    @IBInspectable var cornerRadius: CGFloat = 0{
        didSet{
            layer.cornerRadius = cornerRadius
            layer.masksToBounds = cornerRadius > 0
        }
    }
    
    @IBInspectable var borderColor: UIColor = UIColor.white {
        didSet {
            layer.borderColor = borderColor.cgColor
        }
    }
    
    @IBInspectable var borderWidth: CGFloat = 2.0 {
        didSet {
            layer.borderWidth = borderWidth
        }
    }
}
