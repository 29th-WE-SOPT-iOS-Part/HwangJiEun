//
//  ContentsTVCell.swift
//  29th_Assign_Youtube_Clone
//
//  Created by 황지은 on 2021/10/29.
//

import UIKit
import SnapKit
import Then

class ContentsTVCell: UITableViewCell {
    
    //Mark :- Properties
    var thumbnailImageView = UIImageView().then {
        $0.contentMode = .scaleAspectFit
    }
    var profileImageView = UIImageView().then {
        $0.layer.cornerRadius = $0.frame.height / 2
        $0.contentMode = .scaleAspectFit
    }
    var titleLabel = UILabel().then {
        $0.tintColor = .black
        $0.font = UIFont(name: "SFProDisplay-Regular", size: 15)
        $0.numberOfLines = 0
        $0.sizeToFit()
    }
    var subTitleLabel = UILabel().then {
        $0.textColor = .labelGray
        $0.font = UIFont(name: "SFProDisplay-Regular", size: 13)
        $0.sizeToFit()
    }
    var menuBtn = UIButton().then {
        $0.setBackgroundImage(UIImage(named: "moreMenuIcon"), for: .normal)
    }
    
    //Mark :- LifeCycle
    override func awakeFromNib() {
        super.awakeFromNib()
        configureLayout()
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configureLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been impl")
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func bind(_ thumbnailImage: UIImage, _ profileImage: UIImage, _ titleText: String, _ subtitleText: String ) {
        self.thumbnailImageView.image = thumbnailImage
        self.profileImageView.image = profileImage
        self.titleLabel.text = titleText
        self.subTitleLabel.text = subtitleText
    }
}
//MARK: - Layout
extension ContentsTVCell {
    func configureLayout() {
        self.addSubviews([thumbnailImageView, profileImageView, titleLabel, subTitleLabel, subTitleLabel, menuBtn])
        
        thumbnailImageView.snp.makeConstraints {
            $0.top.leading.trailing.equalTo(self).offset(0)
            $0.height.equalTo(212)
        }
        profileImageView.snp.makeConstraints {
            $0.top.equalTo(thumbnailImageView.snp.bottom).offset(12)
            $0.leading.equalTo(self).offset(12)
            $0.height.equalTo(36)
            $0.width.equalTo(profileImageView.snp.height).multipliedBy(1.0 / 1.0)
        }
        titleLabel.snp.makeConstraints {
            $0.top.equalTo(profileImageView.snp.top)
            $0.leading.equalTo(profileImageView.snp.trailing).offset(12)
            //text길이만큼 label width가 늘어나는게 아니라, 지정된 width값으로 인해 텍스트가 끊겨 내려가므로 width값 지정
            $0.width.equalTo(270)
            $0.height.equalTo(36)
        }
        subTitleLabel.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(4)
            $0.leading.equalTo(titleLabel)
        }
        menuBtn.snp.makeConstraints {
            $0.top.equalTo(profileImageView.snp.top)
            $0.trailing.equalTo(self).offset(0)
            $0.height.equalTo(26)
            $0.width.equalTo(menuBtn.snp.height).multipliedBy(1.0 / 1.0)
        }
    }
}
