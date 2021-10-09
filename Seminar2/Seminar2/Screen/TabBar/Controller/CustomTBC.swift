//
//  CustomTBC.swift
//  Seminar2
//
//  Created by 황지은 on 2021/10/09.
//

import UIKit

class CustomTBC: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setTabBar()
    }
    
    func setTabBar() {
        guard let pinkVC = self.storyboard?.instantiateViewController(withIdentifier: "PinkVC"),
              let mintVC = self.storyboard?.instantiateViewController(withIdentifier: "MintVC")
        else { return }
        
        pinkVC.tabBarItem.title = "Home"
        pinkVC.tabBarItem.image = UIImage(systemName: "house")
        pinkVC.tabBarItem.selectedImage = UIImage(systemName: "house.fill")
        
        mintVC.tabBarItem.title = "Profile"
        mintVC.tabBarItem.image = UIImage(systemName: "person")
        mintVC.tabBarItem.selectedImage = UIImage(systemName: "person.fill")
        
        
        setViewControllers([pinkVC, mintVC], animated: true)
    }
}
