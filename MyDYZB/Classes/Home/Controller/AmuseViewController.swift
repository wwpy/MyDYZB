//
//  AmuseViewController.swift
//  MyDYZB
//
//  Created by 王武 on 2020/11/17.
//

import UIKit

class AmuseViewController: BaseViewController {
    // MARK:- 懒加载属性
    fileprivate lazy var amuseVM: AmuseViewModel = AmuseViewModel()
}

// MARK:- 请求数据
extension AmuseViewController {
    override func loadData() {
        // 1. 给父类ViewModel赋值
        baseVM = amuseVM
        // 2. 请求数据
        amuseVM.loadAmuseData {
            self.collectionView.reloadData()
        }
    }
}


