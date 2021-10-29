//
//  MainContentsData.swift
//  29th_Assign_Youtube_Clone
//
//  Created by 황지은 on 2021/10/29.
//

import UIKit
struct MainContentsData {
    let thumbNailImageName: String
    let profileImageName: String
    let titleText: String
    let nickName: String
    let views: Int
    let uploadDate: String
    
    func makeThumbNailImage() -> UIImage? {
        return UIImage(named: thumbNailImageName)
    }
    func makeProfileImage() -> UIImage? {
        return UIImage(named: profileImageName)
    }
    func makeSubTitleText() -> String? {
        return "\(nickName)・조회수\(views)・\(uploadDate)전"
    }
}

var mainContentList: [MainContentsData] = [
    MainContentsData(thumbNailImageName: "wesoptiOSPart", profileImageName: "wesoptProfile", titleText: "1차 iOS 세미나 : iOS 컴포넌트 이해, Xcode 기본 사용법, View 화면전환", nickName: "WE SOPT", views: 100, uploadDate: "3주"),
    MainContentsData(thumbNailImageName: "wesoptAndroidpart", profileImageName: "wesoptProfile", titleText: "2차 iOS 세미나 : AutoLayout, StackView, TabBarController", nickName: "WE SOPT", views: 200, uploadDate: "3주"),
    MainContentsData(thumbNailImageName: "wesoptServerPart", profileImageName: "wesoptProfile", titleText: "3차 iOS 세미나 : ScrollView, Delegate Pattern, TableView, CollectionView", nickName: "WE SOPT", views: 300, uploadDate: "3주"),
    MainContentsData(thumbNailImageName: "wesoptDesignPart", profileImageName: "wesoptProfile", titleText: "4차 iOS 세미나 : Cocoapods & Networking, REST API", nickName: "WE SOPT", views: 400, uploadDate: "4주"),
    MainContentsData(thumbNailImageName: "wesoptWebPart", profileImageName: "wesoptProfile", titleText: "7차 iOS 세미나 : Animation과 제스쳐, 데이터 전달 심화 ", nickName: "WE SOPT", views: 500, uploadDate: "5주"),
    MainContentsData(thumbNailImageName: "wesoptPlanPart", profileImageName: "wesoptProfile", titleText: "7차 iOS 세미나 : Animation과 제스쳐, 데이터 전달 심화 ", nickName: "WE SOPT", views: 600, uploadDate: "6주"),
    MainContentsData(thumbNailImageName: "wesoptiOSPart", profileImageName: "wesoptProfile", titleText: "7차 iOS 세미나 : Animation과 제스쳐, 데이터 전달 심화 ", nickName: "WE SOPT", views: 700, uploadDate: "3주"),
    MainContentsData(thumbNailImageName: "wesoptiOSPart", profileImageName: "wesoptProfile", titleText: "7차 iOS 세미나 : Animation과 제스쳐, 데이터 전달 심화 ", nickName: "WE SOPT", views: 800, uploadDate: "3주")
]

