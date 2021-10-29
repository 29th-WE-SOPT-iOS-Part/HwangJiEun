//
//  SubscriptionCVCell.swift
//  29th_Assign_Youtube_Clone
//
//  Created by 황지은 on 2021/10/29.
//

import UIKit
import SnapKit
import Then

class SubscriptionCVCell: UICollectionViewCell {
    
    //Mark :- Properties
    var profileImageView = UIImageView()
    var nicknameLabel = UILabel().then {
        $0.textColor = .labelGray
        $0.font = UIFont(name: "SFProDisplay-Regular", size: 12)
        $0.sizeToFit()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureLayout()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.profileImageView.layoutIfNeeded()
        self.profileImageView.layer.cornerRadius = profileImageView.frame.width / 2
        self.profileImageView.layer.masksToBounds = true
    }
    
    func bind(_ profileImage: UIImage, _ nickname: String) {
        self.profileImageView.image = profileImage
        self.nicknameLabel.text = nickname
    }
}
//MARK: - Layout
extension SubscriptionCVCell {
    func configureLayout() {
        self.addSubviews([profileImageView, nicknameLabel])
        
        profileImageView.snp.makeConstraints {
            $0.top.equalTo(self).offset(14)
            $0.height.equalTo(58)
            $0.width.equalTo(profileImageView.snp.height).multipliedBy(1.0 / 1.0)
            $0.centerX.equalTo(self)
        }
        
        nicknameLabel.snp.makeConstraints { 
            $0.top.equalTo(profileImageView.snp.bottom).offset(5)
            $0.centerX.equalTo(profileImageView)
        }
    }
}
