//
//  PageTitleView.swift
//  MyDYZB
//
//  Created by 王武 on 2020/11/2.
//

import UIKit

// MARK: - 定义协议
protocol PageTitleViewDelegate : class {
    func pageTitleView(_ titleView: PageTitleView, selectedIndex index: Int)
}

// MARK: - 定义常量
private let kScrollLineH: CGFloat = 2
private let kNormalColor: (CGFloat, CGFloat, CGFloat) = (85, 85, 85)
private let kSelectedColor: (CGFloat, CGFloat, CGFloat) = (255, 128, 0)

class PageTitleView: UIView {
    // MARK: - 自定义属性
    private var currentIndex: Int = 0
    private var titles: [String]
    weak var delegate: PageTitleViewDelegate?
    
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
            label.textColor = UIColor(r: kNormalColor.0, g: kNormalColor.1, b: kNormalColor.2)
            label.textAlignment = .center
            // 3.设置frame
            let labelX: CGFloat = labelW * CGFloat(index)
            label.frame = CGRect(x: labelX, y: labelY, width: labelW, height: labelH)
            // 4.将label添加到scrollView中
            scrollView.addSubview(label)
            titleLabels.append(label)
            // 5.给Label添加手势
            label.isUserInteractionEnabled = true
            let tapGes = UITapGestureRecognizer(target: self, action: #selector(self.titleLabelClick(_:)))
            label.addGestureRecognizer(tapGes)
        }
    }
    
    private func setupButtomMenuAndScrollLine() {
        // 1.添加底线
        let bottomLine = UIView()
        bottomLine.backgroundColor = UIColor.lightGray
        let lineH: CGFloat = 0.5
        bottomLine.frame = CGRect(x: 0, y: frame.height - lineH, width: frame.width, height: lineH)
        addSubview(bottomLine)
        // 2.添加scrollLine
        // 2.1获取第一个Label
        guard let firstLabel = titleLabels.first else { return }
        firstLabel.textColor = UIColor(r: kSelectedColor.0, g: kSelectedColor.1, b: kSelectedColor.2)
        // 2.2设置scrollLine属性
        scrollView.addSubview(scrollLine)
        scrollLine.frame = CGRect(x: firstLabel.frame.origin.x, y: frame.height-kScrollLineH, width: firstLabel.frame.width, height: kScrollLineH)
    }
}

// MARK: - 添加Label监听
extension PageTitleView {
    @objc private func titleLabelClick(_ tapGes: UITapGestureRecognizer) {
        // 1.获取当前Label
        guard let currentLabel = tapGes.view as? UILabel else { return }
        // 2.重复点击直接返回
        if currentLabel.tag == currentIndex { return }
        // 3.获取上一个Label
        let oldLabel = titleLabels[currentIndex]
        // 4.选择文字颜色
        currentLabel.textColor = UIColor(r: kSelectedColor.0, g: kSelectedColor.1, b: kSelectedColor.2)
        oldLabel.textColor = UIColor(r: kNormalColor.0, g: kNormalColor.1, b: kNormalColor.2)
        // 5.保存最新Label的下标值
        currentIndex = currentLabel.tag
        // 6.滚动条位置发生改变
        let scrollLineX = CGFloat(currentIndex) * scrollLine.frame.width
        UIView.animate(withDuration: 0.15) {
            self.scrollLine.frame.origin.x = scrollLineX
        }
        // 7.通知代理
        delegate?.pageTitleView(self, selectedIndex: currentIndex)
    }
}

//MARK: - 对外暴露方法
extension PageTitleView {
    func setTitleWithProgress(progress: CGFloat, sourceIndex: Int, targetIndex: Int) {
        // 1.取出sourceLabel和targetLabel
        let sourceLabel = titleLabels[sourceIndex]
        let targetLabel = titleLabels[targetIndex]
        
        // 2.处理滑块
        let moveTotalX = targetLabel.frame.origin.x - sourceLabel.frame.origin.x
        let moveX = moveTotalX * progress
        scrollLine.frame.origin.x = sourceLabel.frame.origin.x + moveX
        
        // 3.颜色渐变
        // 3.1取出变化范围
        let colorDelta = (kSelectedColor.0 - kNormalColor.0, kSelectedColor.1 - kNormalColor.1, kSelectedColor.2 - kNormalColor.2)
        // 3.2变化sourceLabel
        sourceLabel.textColor = UIColor(r: kSelectedColor.0 - colorDelta.0 * progress, g: kSelectedColor.1 - colorDelta.1 * progress, b: kSelectedColor.2 - colorDelta.2 * progress)
        // 3.3变化的targetLabel
        targetLabel.textColor = UIColor(r: kNormalColor.0 + colorDelta.0 * progress, g: kNormalColor.1 + colorDelta.1 * progress, b: kNormalColor.2 + colorDelta.2 * progress)
        // 4.记录最新的index
        currentIndex = targetIndex
    }
}
