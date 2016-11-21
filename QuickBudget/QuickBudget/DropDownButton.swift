//
//  DropDownButton.swift
//  QuickBuy
//
//  Created by Thomas Karg on 30.10.16.
//  Copyright © 2016 Thomas KArg. All rights reserved.
//
import UIKit

@IBDesignable
class DropDownButton: UIButton {
    
    
    @IBInspectable
    var triangleColor: UIColor = UIColor.white
    
    @IBInspectable
    var triangleLeftPos: CGFloat = 70
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        setImage(UIImage(named: "Triangle"), for: UIControlState())
        tintColor = triangleColor
        titleEdgeInsets = UIEdgeInsets(top: 0, left: -imageRect(forContentRect: bounds).width, bottom: 0, right: 0)
        imageEdgeInsets = UIEdgeInsets(top: 0, left: triangleLeftPos, bottom: -2, right: 0)
    }
}
