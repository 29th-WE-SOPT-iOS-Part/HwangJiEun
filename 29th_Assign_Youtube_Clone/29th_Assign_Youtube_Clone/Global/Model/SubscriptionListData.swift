//
//  SubscriptionListData.swift
//  29th_Assign_Youtube_Clone
//
//  Created by 황지은 on 2021/10/29.
//

import UIKit

struct SubscriptionListData {
    let profileImageName: String
    let nickName: String
    
    func makeImage() -> UIImage? {
        return UIImage(named: profileImageName)
    }
}

var subscriptionData: [SubscriptionListData] = [
    SubscriptionListData(profileImageName: "hyunzoo", nickName: "YB 현주"),
    SubscriptionListData(profileImageName: "subin", nickName: "OB 수빈"),
    SubscriptionListData(profileImageName: "seunghyun", nickName: "YB 승현"),
    SubscriptionListData(profileImageName: "jieunn", nickName: "OB 지은"),
    SubscriptionListData(profileImageName: "gold", nickName: "🌱금"),
    SubscriptionListData(profileImageName: "zan", nickName: "🌱잔"),
    SubscriptionListData(profileImageName: "dd", nickName: "🌱디"),
    SubscriptionListData(profileImageName: "Pa", nickName: "🌱파"),
    SubscriptionListData(profileImageName: "jandi", nickName: "🌱3"),
    SubscriptionListData(profileImageName: "ggamju8", nickName: "🌱조"),
    SubscriptionListData(profileImageName: "apple", nickName: "🍎")
]

