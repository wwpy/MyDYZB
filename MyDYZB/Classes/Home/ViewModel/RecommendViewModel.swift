//
//  RecommendViewModel.swift
//  MyDYZB
//
//  Created by 王武 on 2020/11/11.
//

import UIKit

class RecommendViewModel {

    // MARK:- 懒加载属性
    lazy var anchorGroups: [AnchorGroup] = [AnchorGroup]()
    lazy var cycleModels: [CycleModel] = [CycleModel]()
    private lazy var bigDataGroup: AnchorGroup = AnchorGroup()
    private lazy var prettyGroup: AnchorGroup = AnchorGroup()
}

// MAEK:- 发送网络请求
extension RecommendViewModel {
    // 请求推荐数据
    func requestData(finishCallback: @escaping () -> ()) {
        // 1. 定义参数
        let params: [String : Any] = ["limit": 4, "offset": 0, "time": NSDate.getCurrentTime()]
        
        // 2. 创建Group
        let disGroup = DispatchGroup()
        
        // 3. 请求 推荐数据
        disGroup.enter()
        EWNetworkTools.ShareInstance.getData(path: "/api/v1/getbigDataRoom", params: ["time": NSDate.getCurrentTime()]) { [weak self](response) in
            // 1. weak self
            guard let weakSelf = self else { return }
            // 2. 获取数据
            guard let dataArray = response as? [[String : Any]] else { return }
            // 3. 遍历字典,并转成模型对象
            // 3.1 设置组的属性
            weakSelf.bigDataGroup.tag_name = "热门"
            weakSelf.bigDataGroup.icon_name = "CollHeader_Hot"
            // 3.2 获取主播数据
            for dict in dataArray {
                let anchor = AnchorModel(dict: dict)
                weakSelf.bigDataGroup.anchors.append(anchor)
            }
            // 3.3 离开组
            disGroup.leave()
        } failure: { (error) in
            print(error)
        }

        // 4.请求颜值数据
        disGroup.enter()
        EWNetworkTools.ShareInstance.getData(path: "/api/v1/getVerticalRoom", params: params) { [weak self](response) in
            // 1. weak self
            guard let weakSelf = self else { return }
            // 2. 获取数据
            guard let dataArray = response as? [[String : Any]] else { return }
            // 3. 遍历字典,并转成模型对象
            // 3.1 设置组的属性
            weakSelf.prettyGroup.tag_name = "颜值"
            weakSelf.prettyGroup.icon_name = "CollHeader_Phone"
            // 3.2 获取主播数据
            for dict in dataArray {
                let anchor = AnchorModel(dict: dict)
                weakSelf.prettyGroup.anchors.append(anchor)
            }
            // 3.3 离开组
            disGroup.leave()
        } failure: { (error) in
            print(error)
        }
        
        // 5.请求其他2-12数据
        disGroup.enter()
        EWNetworkTools.ShareInstance.getData(path: "/api/v1/getHotCate", params: params) { [weak self](response) in
            // 1. 判断
            guard let weakSelf = self else { return }
            // 2. 获取数组
            guard let dataArray = response as? [[String : Any]] else { return }
            // 3. 遍历数组,获取字典,并且将字典转成模型对象
            for dict in dataArray {
                let group = AnchorGroup(dict: dict)
                weakSelf.anchorGroups.append(group)
            }
            // 4. 离开组
            disGroup.leave()
        } failure: { (error) in
            print(error)
        }

        // 6. 所有数据请求完成, 进行排序
        disGroup.notify(queue: DispatchQueue.main) {
            self.anchorGroups.insert(self.prettyGroup, at: 0)
            self.anchorGroups.insert(self.bigDataGroup, at: 0)
            
            finishCallback()
        }
    }
    
    // 请求无限轮播数据
    func requestCycleData(finishCallback: @escaping () -> ()) {
        EWNetworkTools.ShareInstance.getData(path: "/api/v1/slide/6", params: ["version": "2.300"]) { [weak self](response) in
            // weak 弱引用
            guard let weakSelf = self else { return }
            // 获取数据
            guard let dataArray = response as? [[String : Any]] else { return }
            
            // 字典转模型对象
            for dict in dataArray {
                weakSelf.cycleModels.append(CycleModel(dict: dict))
            }
            
            finishCallback()
        } failure: { (error) in
            print(error)
        }

    }
}
