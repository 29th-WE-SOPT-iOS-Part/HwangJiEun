//
//  RakingCVCell.swift
//  Seminar3
//
//  Created by 황지은 on 2021/10/23.
//

import UIKit

class RakingCVCell: UICollectionViewCell {
    static let identifier = "RankingCVCell"
    
    @IBOutlet var appIconImageView: UIImageView!
    @IBOutlet var appNameLabel: UILabel!
    
    func setData(appName: String, appImage: UIImage?) {
        appIconImageView.image = appImage
        appNameLabel.text = appName
    }
}

