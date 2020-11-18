//
//  AmuseViewModel.swift
//  MyDYZB
//
//  Created by 王武 on 2020/11/17.
//

import UIKit

class AmuseViewModel : BaseViewModel {

}

extension AmuseViewModel {
    //
    func loadAmuseData(finishedCallback: @escaping () -> ()) {
        loadAnchorData(isGroupData: true,URLString: "/api/v1/getHotRoom/2", finishedCallback: finishedCallback)
    }
}
