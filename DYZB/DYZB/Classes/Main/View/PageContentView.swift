//
//  PageContentView.swift
//  DYZB
//
//  Created by 然博惠 on 2018/1/24.
//  Copyright © 2018年 lm. All rights reserved.
//

import UIKit

class PageContentView: UIView {

    private var childVcs: [UIViewController]
    private var parentViewController: UIViewController
    
    init(frame: CGRect, childVcs: [UIViewController],parentViewController: UIViewController) {
        self.childVcs = childVcs
        self.parentViewController = parentViewController
        
        super.init(frame: frame)
        
        //setup UI
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension PageContentView{
    private func setupUI(){
        //1.将所有子控制器加入父控制器中
        for childVc in childVcs{
            parentViewController.addChildViewController(childVc)
        }
        //2.添加UICollectionView 用于在Cell中存放控制器View
    }
}
