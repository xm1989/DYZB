//
//  PageTitleView.swift
//  DYZB
//
//  Created by 然博惠 on 2018/1/24.
//  Copyright © 2018年 lm. All rights reserved.
//

import UIKit

class PageTitleView: UIView {
    
    private var titles: [String]
    
    //自定义构造函数
    init(frame: CGRect,titles: [String]) {
        self.titles = titles
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
