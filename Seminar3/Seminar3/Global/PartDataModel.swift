//
//  PartDataModel.swift
//  Seminar3
//
//  Created by 황지은 on 2021/10/23.
//

import UIKit

struct PartData {
    var imageName: String
    var partName: String
    
    func makeImage() -> UIImage? {
        return UIImage(named: imageName)
    }
}
