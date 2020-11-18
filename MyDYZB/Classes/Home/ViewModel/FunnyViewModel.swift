//
//  FunnyViewModel.swift
//  MyDYZB
//
//  Created by 王武 on 2020/11/18.
//

import UIKit

class FunnyViewModel : BaseViewModel {

}

extension FunnyViewModel {
    func loadFunnyData(finishedCallback: @escaping () -> ()) {
        loadAnchorData(isGroupData: false, URLString: "/api/v1/getColumnRoom/2", paramsters: ["limit": 30, "offset": 0], finishedCallback: finishedCallback)
    }
}
