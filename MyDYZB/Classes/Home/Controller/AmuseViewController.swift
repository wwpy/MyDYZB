//
//  AmuseViewController.swift
//  MyDYZB
//
//  Created by 王武 on 2020/11/17.
//

import UIKit

private let kMenuViewH: CGFloat = 200

class AmuseViewController: BaseAnchorViewController {
    // MARK:- 懒加载属性
    fileprivate lazy var amuseVM: AmuseViewModel = AmuseViewModel()
    fileprivate lazy var menuView: AmuseMenuView = {
        let menuView = AmuseMenuView.amuseMenuView()
        menuView.frame = CGRect(x: 0, y: -kMenuViewH, width: kScreenW, height: kMenuViewH)
        
        return menuView
    }()
}

// MARK:- 设置UI界面
extension AmuseViewController {
    override func setupUI() {
        super.setupUI()
        // 将菜单的View添加到控制器的View中
        collectionView.addSubview(menuView)
        collectionView.contentInset = UIEdgeInsets(top: kMenuViewH, left: 0, bottom: 0, right: 0)
    }
}

// MARK:- 请求数据
extension AmuseViewController {
    override func loadData() {
        // 1. 给父类ViewModel赋值
        baseVM = amuseVM
        // 2. 请求数据
        amuseVM.loadAmuseData {
            // 2.1. 刷新表格
            self.collectionView.reloadData()
            // 2.2. 操作数据并赋值
            var tempGroups = self.amuseVM.anchorGroups
            tempGroups.removeFirst()
            self.menuView.groups = tempGroups
            // 2.3. 请求数据完成
            self.loadDataFinished()
        }
    }
}


