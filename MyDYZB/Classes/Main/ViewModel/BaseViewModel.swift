//
//  BaseViewModel.swift
//  MyDYZB
//
//  Created by 王武 on 2020/11/17.
//

import UIKit

class BaseViewModel {
    lazy var anchorGroups: [AnchorGroup] = [AnchorGroup]()
}

extension BaseViewModel {
    func loadAnchorData(URLString: String, paramsters: [String : Any] = [:], finishedCallback: @escaping () -> ()) {
        EWNetworkTools.ShareInstance.getData(path: URLString, params: paramsters) { (response) in
            // 1. 获取数据
            guard let dataArray = response as? [[String : Any]] else { return }
            // 2. 遍历字典
            for dict in dataArray {
                self.anchorGroups.append(AnchorGroup(dict: dict))
            }
            // 2.完成回调
            finishedCallback()
        } failure: { (error) in
            print(error as! [String : Any])
        }
    }
}
