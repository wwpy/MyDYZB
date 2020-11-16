//
//  EWRequest.swift
//  MyDYZB
//
//  Created by 王武 on 2020/11/15.
//

import Foundation

extension EWNetworkTools {
    ///get请求
    func getData(path: String,
                 params: [String : Any],
                 success: @escaping EWResponseSuccess,
                 failure: @escaping EWResponseFail) {
        EWNetworkTools.ShareInstance.getWith(url: path, params: params) { (response) in
            // 1.将response转换成字典类型
            guard let json = response as? [String : Any] else {
                failure(NSError(domain: "转字典失败", code: 2000, userInfo: nil))
                return
            }
            /// 2. 保证接口调通，则返回错误信息
            guard json["error"] as? NSNumber == 0 else {
                failure(response)
                return
            }
            // 3.获取数组
            guard let dataArray = json["data"] as? [[String : Any]] else {
                failure(NSError(domain: "获取数组失败", code: 2000, userInfo: nil))
                return
            }
            /// 4.成功
            success(dataArray as AnyObject)
        } error: { (error) in
            failure(error)
        }
    }
    ///post请求
    func postData(path: String,
                  params: [String : Any],
                  success: @escaping EWResponseSuccess,
                  failure: @escaping EWResponseFail) {
        EWNetworkTools.ShareInstance.postWith(url: path, params: params) { (response) in
            guard let json = response as? [String : Any] else { return }
            guard json["status"] as? NSNumber == 1 else {
                print(json["msg"] as? String ?? "")
                failure(response)
                return
            }
            success(response as AnyObject)
        } error: { (error) in
            failure(error)
        }
    }
    
}


