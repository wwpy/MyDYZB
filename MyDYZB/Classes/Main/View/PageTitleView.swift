//
//  PageTitleView.swift
//  MyDYZB
//
//  Created by 王武 on 2020/11/2.
//

import UIKit

private let kScrollLineH: CGFloat = 2

class PageTitleView: UIView {
    // MARK: - 自定义属性
    private var titles: [String]
    
    // MARK: - 懒加载属性
    private lazy var titleLabels: [UILabel] = [UILabel]()
    private lazy var scrollView: UIScrollView = {
       let scrollView = UIScrollView()
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.scrollsToTop = false
        scrollView.isPagingEnabled = false
        scrollView.bounces = false
        
        return scrollView
    }()
    private lazy var scrollLine: UIView = {
       let scrollLine = UIView()
        scrollLine.backgroundColor = UIColor.orange
        
        return scrollLine
    }()

    // MARK: - 自定义构造函数
    init(frame: CGRect, titles: [String]) {
        self.titles = titles
        
        super.init(frame: frame)
        // 设置UI界面
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}


extension PageTitleView {
    private func setupUI() {
        // 1. 添加UIScrollView
        addSubview(scrollView)
        scrollView.frame = bounds
        // 2. 添加title对应的Label
        setupTitleLables()
        // 3.设置底线和滚动的滑块
        setupButtomMenuAndScrollLine()
    }
    
    private func setupTitleLables() {
        for (index, title) in titles.enumerated() {
            let labelW: CGFloat = frame.width / CGFloat(titles.count)
            let labelH: CGFloat = frame.height - kScrollLineH
            let labelY: CGFloat = 0
            // 1. 创建UILabel
            let label = UILabel()
            
            // 2.设置Label属性
            label.text = title
            label.tag = index
            label.font = UIFont.systemFont(ofSize: 16.0)
            label.textColor = UIColor.darkGray
            label.textAlignment = .center
            // 3.设置frame
            let labelX: CGFloat = labelW * CGFloat(index)
            label.frame = CGRect(x: labelX, y: labelY, width: labelW, height: labelH)
            // 4.将label添加到scrollView中
            scrollView.addSubview(label)
            titleLabels.append(label)
        }
    }
    
    private func setupButtomMenuAndScrollLine() {
        // 1.添加底线
        let bottomLine = UIView()
        bottomLine.backgroundColor = UIColor.lightGray
        let lineH: CGFloat = 0.5
        bottomLine.frame = CGRect(x: 0, y: frame.height-lineH, width: frame.width, height: lineH)
        addSubview(bottomLine)
        // 2.添加scrollLine
        // 2.1获取第一个Label
        guard let firstLabel = titleLabels.first else { return }
        firstLabel.textColor = UIColor.orange
        // 2.2设置scrollLine属性
        scrollView.addSubview(scrollLine)
        scrollLine.frame = CGRect(x: firstLabel.frame.origin.x, y: frame.height-kScrollLineH, width: firstLabel.frame.width, height: kScrollLineH)
    }
}
