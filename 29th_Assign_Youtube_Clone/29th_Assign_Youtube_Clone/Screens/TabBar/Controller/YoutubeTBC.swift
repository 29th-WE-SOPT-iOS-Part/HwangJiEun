//
//  YoutubeTBC.swift
//  29th_Assign_Youtube_Clone
//
//  Created by 황지은 on 2021/10/22.
//

import UIKit

class YoutubeTBC: UITabBarController {
    
    let userDisplayInterfaceStyle = UITraitCollection.current.userInterfaceStyle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setTabBar()
    }
    
    //MARK: - Custom Method
    /// makeTabVC - 탭별 아이템 생성하는 함수
    func makeTabVC<T>(storyboardName: String, identifier: String, vcName: T, tabBarTitle: String, tabBarImage: String, tabBarSelectedImage: String) -> T? where T: UIViewController {
        let sb = UIStoryboard.init(name: storyboardName, bundle: nil)
        guard let tab = sb.instantiateViewController(withIdentifier: identifier) as? T else { return nil }
        tab.tabBarItem = UITabBarItem(title: tabBarTitle, image: UIImage(named: tabBarImage), selectedImage: UIImage(named: tabBarSelectedImage))
        tab.tabBarItem.imageInsets = UIEdgeInsets(top: -0.5, left: -0.5, bottom: -0.5, right: -0.5)
        return tab
    }
    
    /// setTabBar - 탭바 Setting
    func setTabBar() {
        
        guard let homeTab = makeTabVC(storyboardName: "Home", identifier: identifiers.HomeVC, vcName: HomeVC(), tabBarTitle: "홈", tabBarImage: "homeIcon", tabBarSelectedImage: "homeIconFill"),
              let shortsTab = makeTabVC(storyboardName: "Shorts", identifier: identifiers.ShortsVC, vcName: ShortsVC(), tabBarTitle: "Shorts", tabBarImage: "shortsIcon", tabBarSelectedImage: "shortsIconFill"),
              let addTab = makeTabVC(storyboardName: "Add", identifier: identifiers.AddVC, vcName: AddVC(), tabBarTitle: "", tabBarImage: "plueCircleIcon", tabBarSelectedImage: "plueCircleIcon"),
              let subscribeTab = makeTabVC(storyboardName: "Subscribe", identifier: identifiers.SubscribeVC, vcName: SubscribeVC(), tabBarTitle: "구독", tabBarImage: "subscriptionsIcon", tabBarSelectedImage: "subscriptionsIconFill"),
              let cabinetTab = makeTabVC(storyboardName: "Cabinet", identifier: identifiers.CabinetVC, vcName: CabinetVC(), tabBarTitle: "보관함", tabBarImage: "LibraryIcon", tabBarSelectedImage: "LibraryIconFill") else { return }
        
        // 탭바 스타일 설정
        tabBar.frame.size.height = 65
        tabBar.tintColor = .black
        tabBar.layer.shadowOpacity = 0
        tabBar.layer.shadowOffset = CGSize(width: 0, height: 0)
        tabBar.layer.borderWidth = 0.3
        tabBar.layer.borderColor = UIColor.lightGray.cgColor
        tabBar.clipsToBounds = true
        //다크모드, 라이트모드 설정
        if userDisplayInterfaceStyle == .dark {
            tabBar.tintColor = .white
        }
        else {
            tabBar.tintColor = .black
        }
        
        //
        // 탭 구성
        let tabs =  [homeTab, shortsTab, addTab, subscribeTab, cabinetTab]
        
        // VC에 루트로 설정
        self.setViewControllers(tabs, animated: false)
    }
}
