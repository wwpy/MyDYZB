//
//  GameViewModel.swift
//  MyDYZB
//
//  Created by 王武 on 2020/11/16.
//

import UIKit

class GameViewModel {
    lazy var games: [GameModel] = [GameModel]()
}

extension GameViewModel {
    func loadAllGameData(finishedCallback: @escaping () -> ()) {
        // http://capi.douyucdn.cn/api/v1/getColumnDetail?shortName=game
        EWNetworkTools.ShareInstance.getData(path: "/api/v1/getColumnDetail", params: [:]) { (response) in
            // 1. 获取数据
            guard let dataArray = response as? [[String : Any]] else { return }
            // 2.字典转模型
            for dict in dataArray {
                self.games.append(GameModel(dict: dict))
            }
            // 3.完成回调
            finishedCallback()
        } failure: { (error) in
            print(error as! [String : Any])
        }

    }
}
