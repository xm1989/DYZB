//
//  HomeViewController.swift
//  DYZB
//
//  Created by 然博惠 on 2018/1/23.
//  Copyright © 2018年 lm. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
}

//设置UI
extension HomeViewController
{
    private func setupUI()
    {
        setupNavigationBar()
    }
    
    private func setupNavigationBar()
    {
        //left item
        let btn = UIButton()
        btn.setImage(UIImage(named:"logo"), for: .normal)
        btn.sizeToFit()
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: btn)
        
        let size = CGSize(width: 40, height: 40)
        //right items
        /*let historyBtn = UIButton()
        historyBtn.setImage(UIImage(named:"image_my_history"), for: .normal)
        historyBtn.setImage(UIImage(named:"Image_my_history_click"), for: .highlighted)
        historyBtn.frame = CGRect(origin: CGPoint.zero, size: size)*/
        //let historyItem = UIBarButtonItem(customView: historyBtn)
        
        /*
        let historyItem = UIBarButtonItem.createItem(imageName: "image_my_history", highImageName: "Image_my_history_click", size: size)
        let searchItem = UIBarButtonItem.createItem(imageName: "btn_search", highImageName: "btn_search_clicked", size: size)
        let qrcodeItem = UIBarButtonItem.createItem(imageName: "Image_scan", highImageName: "Image_scan_click", size: size)
        */
        
        let historyItem = UIBarButtonItem(imageName: "image_my_history", highImageName: "Image_my_history_click", size: size)
        let searchItem = UIBarButtonItem(imageName: "btn_search", highImageName: "btn_search_clicked", size: size)
        let qrcodeItem = UIBarButtonItem(imageName: "Image_scan", highImageName: "Image_scan_click", size: size)
        
        navigationItem.rightBarButtonItems = [historyItem,searchItem,qrcodeItem]
        
    }
}








