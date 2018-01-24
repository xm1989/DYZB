//
//  UIColor-Extension.swift
//  DYZB
//
//  Created by 然博惠 on 2018/1/24.
//  Copyright © 2018年 lm. All rights reserved.
//

import UIKit

extension UIColor{
    convenience init(r: CGFloat,g: CGFloat,b: CGFloat){
        self.init(red: r / 255.0, green: g / 255.0, blue: b / 255.0,alpha: 1.0)
    }
}
