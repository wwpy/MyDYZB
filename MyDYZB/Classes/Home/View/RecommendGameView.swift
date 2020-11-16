//
//  RecommendGameView.swift
//  MyDYZB
//
//  Created by 王武 on 2020/11/16.
//

import UIKit

private let kGameCellID = "kGameCellID"
private let kEdgeInsetMargin: CGFloat = 15

class RecommendGameView: UIView {
    // MARK:- 定义数据属性
    var groups: [AnchorGroup]? {
        didSet {
            // 1.移出前两组数据
            groups?.removeFirst()
            groups?.removeFirst()
            // 2.添加更多组
            let moreGroup = AnchorGroup()
            moreGroup.tag_name = "更多"
            groups?.append(moreGroup)
            // 3.刷新数据
            collectionView.reloadData()
        }
    }
    
    // MARK:- 控件属性
    @IBOutlet weak var collectionView: UICollectionView!
    
    // MARK:- 系统函数
    override func awakeFromNib() {
        super.awakeFromNib()
        
        // 设置不随父控件的变化而变化
        autoresizingMask = [.flexibleWidth]
        // 注册cell
        collectionView.register(UINib(nibName: "CollectionGameCell", bundle: nil), forCellWithReuseIdentifier: kGameCellID)
        // collectionView添加内边距
        collectionView.contentInset = UIEdgeInsets(top: 0, left: kEdgeInsetMargin, bottom: 0, right: kEdgeInsetMargin)
    }

}

// MARK:- 快速创建类方法
extension RecommendGameView {
    class func recommendGameView() -> RecommendGameView {
        return Bundle.main.loadNibNamed("RecommendGameView", owner: nil, options: nil)?.first as! RecommendGameView
    }
}

// MARK:- 遵守UICollectionView的数据源协议
extension RecommendGameView : UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: kGameCellID,
            for: indexPath) as! CollectionGameCell

        cell.group = groups![indexPath.item]
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return groups?.count ?? 0
    }
}
