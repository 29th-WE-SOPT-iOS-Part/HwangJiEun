//
//  TagCVCell.swift
//  29th_Assign_Youtube_Clone
//
//  Created by 황지은 on 2021/10/29.
//

import UIKit
import SnapKit
import Then

class TagCVCell: UICollectionViewCell {
    //Mark :- Properties
    var tagNameLabel = UILabel().then {
        $0.tintColor = .black
        $0.font = UIFont(name: "SFProDisplay-Regular", size: 14)
    }
    
    override var isSelected: Bool {
        didSet {
            if isSelected {
                //select
                backgroundColor = .darkGray
                tagNameLabel.textColor = .white
            } else {
                //unselect
                backgroundColor = .tagBackgroundGray
                tagNameLabel.textColor = .black
            }
        }
    }
    
    //Mark :- LifeCycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpProperties()
        configureLayout()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    func setUpProperties() {
        self.backgroundColor = .tagBackgroundGray
        self.layer.borderWidth = 1
        self.layer.borderColor = UIColor.tagBorderGray.cgColor
        self.layer.cornerRadius = self.frame.height / 2
    }
    
    func bind(_ tagName: String) {
        self.tagNameLabel.text = tagName
        self.tagNameLabel.sizeToFit()
    }
}
//MARK: - Layout
extension TagCVCell {
    func configureLayout() {
        self.addSubview(tagNameLabel)
        tagNameLabel.snp.makeConstraints {
            $0.center.equalToSuperview()
        }
    }
}
