//
//  UserDefaults+Extension.swift
//  29th_Assign_Youtube_Clone
//
//  Created by 황지은 on 2021/11/11.
//

import Foundation
extension UserDefaults {
    // UserDefaults key value가 많아지면 관리하기 어려워지므로 enum 'Keys'로 묶어 관리
    enum Keys {
        static var loginUserName = "loginUserName"
    }
}
