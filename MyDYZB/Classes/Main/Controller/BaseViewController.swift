//
//  BaseViewController.swift
//  MyDYZB
//
//  Created by 王武 on 2020/11/18.
//

import UIKit

class BaseViewController: UIViewController {
    // MARK:- 定义属性
    var contentView: UIView?
    
    // MARK:- 懒加载属性
    fileprivate lazy var animImageView: UIImageView = { [unowned self] in
        let imageView = UIImageView(image: UIImage(named: "dyla_img_loading_000"))
        imageView.center = self.view.center
        imageView.animationImages = [
            UIImage(named: "dyla_img_loading_000")!,
            UIImage(named: "dyla_img_loading_001")!
        ]
        imageView.animationDuration = 0.5
        imageView.animationRepeatCount = LONG_MAX
        imageView.autoresizingMask = [.flexibleTopMargin, .flexibleBottomMargin]
        
        return imageView
    }()
    
    // MARK:- 系统函数
    override func viewDidLoad() {
        super.viewDidLoad()
    }

}

extension BaseViewController {
    @objc func setupUI() {
        // 1. 隐藏内容的UIView
        contentView?.isHidden = true
        // 2. 添加执行动画的UIImageView
        view.addSubview(animImageView)
        // 3. 执行animImageVIew动画
        animImageView.startAnimating()
        // 4. 设置View的背景颜色
        view.backgroundColor = UIColor(r: 30.0, g: 30.0, b: 30.0)
    }
    
    func loadDataFinished() {
        // 1. 停止动画
        animImageView.stopAnimating()
        // 2. 隐藏animImageView
        animImageView.isHidden = true
        // 3. 显示内容contentView
        contentView?.isHidden = false
    }
}
