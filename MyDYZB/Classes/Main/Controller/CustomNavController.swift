//
//  CustomNavController.swift
//  MyDYZB
//
//  Created by 王武 on 2020/11/18.
//

import UIKit

class CustomNavController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        // 隐藏要push的控制器的tabbar
        viewController.hidesBottomBarWhenPushed = true

        super.pushViewController(viewController, animated: animated)
    }
}
