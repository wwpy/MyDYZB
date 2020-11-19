//
//  MainTabBarController.swift
//  MyDYZB
//
//  Created by 王武 on 2020/10/25.
//

import UIKit

class MainTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        addChildVc(storyboard: "Home")
        addChildVc(storyboard: "Live")
        addChildVc(storyboard: "Follow")
        addChildVc(storyboard: "Profile")
    }
    
    private func addChildVc(storyboard: String) {
        // 1. 通过 storyboard 获取控制器, 实例化初始视图控制器
        let childVc = UIStoryboard(name: storyboard, bundle: nil).instantiateInitialViewController()!
        
        // 2. 将childVc作为子控制器
        addChild(childVc)
    }
}
