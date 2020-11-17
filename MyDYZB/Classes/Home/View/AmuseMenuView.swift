//
//  AmuseMenuView.swift
//  MyDYZB
//
//  Created by 王武 on 2020/11/17.
//

import UIKit

class AmuseMenuView: UIView {

}

extension AmuseMenuView {
    class func amuseMenuView() -> AmuseMenuView {
        return Bundle.main.loadNibNamed("AmuseMenuView", owner: nil, options: nil)?.first as! AmuseMenuView
    }
}
