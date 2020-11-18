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
    func loadAnchorData(isGroupData: Bool,URLString: String, paramsters: [String : Any] = [:], finishedCallback: @escaping () -> ()) {
        EWNetworkTools.ShareInstance.getData(path: URLString, params: paramsters) { (response) in
            // 1. 获取数据
            guard let dataArray = response as? [[String : Any]] else { return }
            // 2. 判断是否是分组数据
            if isGroupData {
                // 2.1 遍历数组中的字典
                for dict in dataArray {
                    self.anchorGroups.append(AnchorGroup(dict: dict))
                }
            } else {
                // 2.1 创建组
                let group = AnchorGroup()
                // 2.2 遍历dataArray的所有的字典
                for dict in dataArray {
                    group.anchors.append(AnchorModel(dict: dict))
                }
                // 2.3 将group, 添加到anchorGroups
                self.anchorGroups.append(group)
            }
            
            // 2.完成回调
            finishedCallback()
        } failure: { (error) in
            print(error as! [String : Any])
        }
    }
}
