//
//  ShortAddButton.swift
//  QuickBuy
//
//  Created by Thomas Karg on 31.10.16.
//  Copyright © 2016 Thomas KArg. All rights reserved.
//

import UIKit

class ShortAddButton: UIButton {
    
    var labelMsg1:String
    var labelMsg2:String
    
    var label1 = UILabel()
    var label2 = UILabel()
    
    init(frame: CGRect, labelMsg1: String, labelMsg2: String){
        
        self.labelMsg1 = labelMsg1
        self.labelMsg2 = labelMsg2
        super.init(frame: frame)
        
        label1.frame = CGRect(x: 0, y: 0, width: 111, height: 29)
        label1.textAlignment = NSTextAlignment.center
        label1.font = UIFont.systemFont(ofSize: 24, weight: UIFontWeightLight)
        label1.text = self.labelMsg1
        
        
        label2.frame = CGRect(x: 0, y: 29, width: 111, height: 19)
        label2.textAlignment = NSTextAlignment.center
        label2.font = UIFont.systemFont(ofSize: 14, weight: UIFontWeightLight)
        label2.text = self.labelMsg2
        
        setTextColor(UIColor(red:0.14, green:0.62, blue:0.52, alpha:1.0))
        
        addSubview(label1)
        addSubview(label2)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setTextColor(_ color:UIColor!) {
        
        label1.textColor = color
        label2.textColor = color
    }
}
