//
//  RankingTVCell.swift
//  Seminar3
//
//  Created by 황지은 on 2021/10/23.
//

import UIKit

class RankingTVCell: UITableViewCell {
    static let identifier = "RankingTVCell"

    @IBOutlet var appIconImageView: UIImageView!
    @IBOutlet var rankLabel: UILabel!
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var subTitleLabel: UILabel!
    @IBOutlet var openButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func setAppData(rank: Int, appData: AppContentData) {
        rankLabel.text = "\(rank)"
        appIconImageView.image = appData.makeImage()
        titleLabel.text = appData.appName
        subTitleLabel.text = appData.description
    }
}
