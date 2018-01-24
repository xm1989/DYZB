//
//  PageTitleView.swift
//  DYZB
//
//  Created by 然博惠 on 2018/1/24.
//  Copyright © 2018年 lm. All rights reserved.
//

import UIKit

protocol PageTitleViewDelegate : class {
    func pageTitleView(titleView : PageTitleView,selectedIndex index : Int)
}

class PageTitleView: UIView {
    
    //delegate
    weak var delegate: PageTitleViewDelegate?
    
    private var titles: [String]
    private var currentIndex = 0
    private let scrollLineH: CGFloat = 2
    
    private lazy var scrollView: UIScrollView={
        let scrollView = UIScrollView()
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.scrollsToTop = false
        scrollView.bounces = false
        return scrollView
    }()
    
    private lazy var scrollLine: UIView={
        let scrollLine = UIView()
        scrollLine.backgroundColor = UIColor.orange
        return scrollLine
    }()
    
    private lazy var titlelabels : [UILabel] = [UILabel]()
    
    //自定义构造函数
    init(frame: CGRect,titles: [String]) {
        self.titles = titles
        super.init(frame: frame)
        
        //shezhi UI jiemian
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension PageTitleView{
    private func setupUI(){
        //1. tianjia uiscrollview
        addSubview(scrollView)
        scrollView.frame = bounds
        //2.tianjia label
        setupTitleLabels()
        //3 设置底线和滚动滑块
        setupBottomMenuAndScrollLine()
    }
    
    private func setupTitleLabels(){
        
        let labelW: CGFloat = frame.width / CGFloat(titles.count)
        let labelH: CGFloat = frame.height - scrollLineH
        let labelY: CGFloat = 0
        
        for (index,title) in titles.enumerated(){
            //1.chuangjian uilabel
            let label = UILabel()
            
            label.text = title
            label.tag = index
            label.font = UIFont.systemFont(ofSize: 16)
            label.textColor = UIColor.darkGray
            label.textAlignment = .center
            
            let labelX: CGFloat = labelW * CGFloat(index)
            
            label.frame = CGRect(x: labelX,y: labelY,width: labelW,height: labelH)
            
            scrollView.addSubview(label)
            titlelabels.append(label)
            
            //添加手势
            label.isUserInteractionEnabled = true
            let tapGes = UITapGestureRecognizer(target: self, action: #selector(self.titleLabelClick(tapGes:)))
            label.addGestureRecognizer(tapGes)
        }
    }
    
    private func setupBottomMenuAndScrollLine(){
        //bottom line
        let bottom = UIView()
        bottom.backgroundColor = UIColor.lightGray
        let lineH: CGFloat = 0.5
        bottom.frame = CGRect(x: 0, y: frame.height-lineH, width: frame.width, height: lineH)
        addSubview(bottom)
        
        guard  let firstLabel = titlelabels.first else { return }
        firstLabel.textColor = UIColor.orange
        scrollView.addSubview(scrollLine)
        scrollLine.frame = CGRect(x: firstLabel.frame.origin.x, y: frame.height - scrollLineH, width: firstLabel.frame.width, height: scrollLineH)
    }
    
}


extension PageTitleView{
    @objc private func titleLabelClick(tapGes : UITapGestureRecognizer){
        //get current label
        guard let currentLabel = tapGes.view as? UILabel else { return }
        //old label
        let oldLabel = titlelabels[currentIndex]
        currentIndex = currentLabel.tag
        //text color
        oldLabel.textColor = UIColor.darkGray
        currentLabel.textColor = UIColor.orange
        
        //gundongtiao weizhi
        let scrollLineX = CGFloat(currentLabel.tag) * scrollLine.frame.width
        UIView.animate(withDuration: 0.15){
            self.scrollLine.frame.origin.x = scrollLineX
        }
        
        //delegate
        delegate?.pageTitleView(titleView: self, selectedIndex: currentIndex)
        
    }
}
















