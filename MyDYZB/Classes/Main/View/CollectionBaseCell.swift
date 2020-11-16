//
//  CollectionBaseCell.swift
//  MyDYZB
//
//  Created by 王武 on 2020/11/15.
//

import UIKit

class CollectionBaseCell: UICollectionViewCell {
    
    // MARK:- 控件属性
    @IBOutlet weak var iconImageView: UIImageView!
    @IBOutlet weak var nicknameLabel: UILabel!
    @IBOutlet weak var onlineBtn: UIButton!
    
    var anchor: AnchorModel? {
        didSet {
            // 1. 校验模型是否有值
            guard let anchor = anchor else { return }
            // 2. 设置属性值
            var onlineStr: String = ""
            if anchor.online >= 10000 {
                onlineStr = "\(Int(anchor.online / 10000))万在线"
            } else {
                onlineStr = "\(anchor.online)在线"
            }
            onlineBtn.setTitle(onlineStr, for: .normal)
            // 3. 设置昵称
            nicknameLabel.text = anchor.nickname
            // 4. 设置封面图片
            guard let iconURL = URL(string: anchor.vertical_src) else { return }
            iconImageView.kf.setImage(with: iconURL)
        }
    }
}
