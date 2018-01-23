//
//  UIBarButtonItem-Extension.swift
//  DYZB
//
//  Created by 然博惠 on 2018/1/23.
//  Copyright © 2018年 lm. All rights reserved.
//

import UIKit

extension UIBarButtonItem{
   class func createItem(imageName : String,highImageName: String, size: CGSize)->UIBarButtonItem{
        let btn = UIButton()
        
        btn.setImage(UIImage(named: imageName), for: .normal)
        btn.setImage(UIImage(named: highImageName), for: .highlighted)
        btn.frame = CGRect(origin: CGPoint.zero, size: size)
        
        return UIBarButtonItem(customView: btn)
        
    }
    
    //便利构造函数 1.convenience开头 2.在构造函数中必须调用一个设计的构造函数(self)
    convenience  init(imageName : String,highImageName: String, size: CGSize)
    {
        let btn = UIButton()
        btn.setImage(UIImage(named: imageName), for: .normal)
        btn.setImage(UIImage(named: highImageName), for: .highlighted)
        btn.frame = CGRect(origin: CGPoint.zero, size: size)
        self.init(customView : btn)
    }
    
    
}
