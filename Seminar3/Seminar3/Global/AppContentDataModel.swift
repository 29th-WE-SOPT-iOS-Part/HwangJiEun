//
//  AppContentDataModel.swift
//  Seminar3
//
//  Created by 황지은 on 2021/10/23.
//

import UIKit

struct AppContentData {
    let appName: String
    let description: String
    let appIconName: String
    
    func makeImage() -> UIImage? {
        return UIImage(named: appIconName)
    }
}
