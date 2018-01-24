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
    private weak var parentViewController: UIViewController?
    
    private lazy var collectionView: UICollectionView = {[weak self] in
        //c layout
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = (self?.bounds.size)!
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 0
        layout.scrollDirection = .horizontal
        //c UICollectionView
        let collectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: layout)
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.isPagingEnabled = false
        collectionView.bounces = false
        
        //监听滚动
        collectionView.delegate = self
        
        //c datasource
        collectionView.dataSource = self
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "ContentCellID")
        
        
        return collectionView
    }()
    
    init(frame: CGRect, childVcs: [UIViewController],parentViewController: UIViewController?) {
        self.childVcs = childVcs
        self.parentViewController = parentViewController
        
        super.init(frame: frame)
        
        //setup UI
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension PageContentView{
    private func setupUI(){
        //1.将所有子控制器加入父控制器中
        for childVc in childVcs{
            parentViewController?.addChildViewController(childVc)
        }
        //2.添加UICollectionView 用于在Cell中存放控制器View
        addSubview(collectionView)
        collectionView.frame = bounds
    }
}

//datasource xieyi
//遵守UICollectionViewDataSource
extension PageContentView : UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return childVcs.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ContentCellID", for: indexPath)
        
        for view in cell.contentView.subviews{
            view.removeFromSuperview()
        }
        
        let childVc = childVcs[indexPath.item]
        childVc.view.frame = cell.contentView.bounds
        cell.contentView.addSubview(childVc.view)
        
        return cell
    }
}

//遵守UICollectionViewDelegate
extension PageContentView : UICollectionViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        //获取需要的数据
    }
}

//外部方法
extension PageContentView{
    func setCurrentIndex(currentIndex: Int){
        let offsetX = CGFloat(currentIndex) * collectionView.frame.width
        collectionView.setContentOffset(CGPoint(x:offsetX,y:0), animated: false)
    }
}






