//
//  YoutubeTBC.swift
//  29th_Assign_Youtube_Clone
//
//  Created by 황지은 on 2021/10/22.
//

import UIKit

class YoutubeTBC: UITabBarController {
    
    static let identifier = "YoutubeTBC"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setTabBar()
    }
    // MARK: - 탭바 만드는 함수
    
    func setTabBar() {
        
        // 탭바 스타일 설정
        tabBar.frame.size.height = 65
        tabBar.tintColor = .black
        tabBar.layer.shadowOpacity = 0
        tabBar.layer.shadowOffset = CGSize(width: 0, height: 0)
        tabBar.layer.borderWidth = 0.3
        tabBar.layer.borderColor = UIColor.lightGray.cgColor
        tabBar.clipsToBounds = true
        
        
        /// HomeTab
        let homeSB = UIStoryboard.init(name: "Home", bundle: nil)
        guard let homeTab = homeSB.instantiateViewController(identifier: HomeVC.identifier) as? HomeVC else { return }
        homeTab.title = "홈"
        homeTab.tabBarItem.image = UIImage(named: "homeIcon")
        homeTab.tabBarItem.selectedImage = UIImage(named: "homeIconFill")
        homeTab.tabBarItem.imageInsets = UIEdgeInsets(top: -0.5, left: -0.5, bottom: -0.5, right: -0.5)
        
        
        /// ShortsTab
        let shortsSB = UIStoryboard.init(name: "Shorts", bundle: nil)
        guard let shortsTab = shortsSB.instantiateViewController(identifier: ShortsVC.identifier)
                as? ShortsVC else { return }
        shortsTab.title = "Shorts"
        shortsTab.tabBarItem.image = UIImage(named: "shortsIcon")
        shortsTab.tabBarItem.selectedImage = UIImage(named: "shortsIconFill")
        shortsTab.tabBarItem.imageInsets = UIEdgeInsets(top: -0.5, left: -0.5, bottom: -0.5, right: -0.5)
        
        
        /// AddTab
        let addSB = UIStoryboard.init(name: "Add", bundle: nil)
        guard let addTab = addSB.instantiateViewController(identifier: AddVC.identifier)
                as? AddVC else { return }
        addTab.tabBarItem.image = UIImage(named: "plueCircleIcon")
        addTab.tabBarItem.selectedImage = UIImage(named: "plueCircleIcon")
        addTab.tabBarItem.imageInsets = UIEdgeInsets(top: -13, left: -13, bottom: -13, right: -13)
        
        
        /// SubscribeTab
        let subscribeSB = UIStoryboard.init(name: "Subscribe", bundle: nil)
        guard let subscribeTab = subscribeSB.instantiateViewController(identifier: SubscribeVC.identifier)
                as? SubscribeVC else { return }
        subscribeTab.title = "구독"
        subscribeTab.tabBarItem.image = UIImage(named: "subscriptionsIcon")
        subscribeTab.tabBarItem.selectedImage = UIImage(named: "subscriptionsIconFill")
        subscribeTab.tabBarItem.imageInsets = UIEdgeInsets(top: -0.5, left: -0.5, bottom: -0.5, right: -0.5)
        
        
        /// CabinetTab
        let cabinetSB = UIStoryboard.init(name: "Cabinet", bundle: nil)
        guard let cabinetTab = cabinetSB.instantiateViewController(identifier: CabinetVC.identifier)
                as? CabinetVC else { return }
        cabinetTab.title = "보관함"
        cabinetTab.tabBarItem.image = UIImage(named: "LibraryIcon")
        cabinetTab.tabBarItem.selectedImage = UIImage(named: "LibraryIconFill")
        cabinetTab.tabBarItem.imageInsets = UIEdgeInsets(top: -0.5, left: -0.5, bottom: -0.5, right: -0.5)
        
        // 탭 구성
        let tabs =  [homeTab, shortsTab, addTab, subscribeTab, cabinetTab]
        
        // VC에 루트로 설정
        self.setViewControllers(tabs, animated: false)
    }
}
