//
//  MainViewController.swift
//  DYZB
//
//  Created by 然博惠 on 2018/1/23.
//  Copyright © 2018年 lm. All rights reserved.
//

import UIKit

class MainViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        add(name: "Home")
        add(name: "Live")
        add(name: "Follow")
        add(name: "Profile")
        
    }

    private func add(name: String)
    {
        let childVc = UIStoryboard(name: name, bundle: nil).instantiateInitialViewController()!
        addChildViewController(childVc)
    }
    

}
