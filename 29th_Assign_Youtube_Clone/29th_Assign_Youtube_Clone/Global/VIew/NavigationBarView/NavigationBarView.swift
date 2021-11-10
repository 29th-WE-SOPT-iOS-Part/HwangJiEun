//
//  NavigationBarView.swift
//  29th_Assign_Youtube_Clone
//
//  Created by 황지은 on 2021/10/29.
//

import UIKit
import SnapKit
import Then

class NavigationBarView: UIView {
    
    //Mark: - Properties
    private var mainIconImage = UIImageView().then {
        $0.image = UIImage(named: "premiumLogo")
    }
    private var windowSharingBtn = UIButton().then {
        $0.setBackgroundImage(UIImage(named: "windowSharingIcon"), for: .normal)
    }
    private var notificationBtn = UIButton() .then {
        $0.setBackgroundImage(UIImage(named: "notificationIcon"), for: .normal)
    }
    private var searchBtn = UIButton() .then {
        $0.setBackgroundImage(UIImage(named: "SearchIcon"), for: .normal)
    }
    private var profileBtn = UIButton().then {
        $0.setBackgroundImage(UIImage(named: "wesoptProfile"), for: .normal)
        $0.addTarget(self, action: #selector(pushSignNCDidTap), for: .touchUpInside)
    }
    
    //Mark :- Life Cycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
        makeLayout()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    private func commonInit() {
        let view = Bundle.main.loadNibNamed(identifiers.navigationBarView, owner: self, options: nil)?.first as! UIView
        view.frame = self.bounds
        self.addSubview(view)
    }
    
    @objc func pushSignNCDidTap() {
        let signNC = ViewControllerFactory.viewController(for: .signNC)
        signNC.modalPresentationStyle = .fullScreen
        self.window?.rootViewController?.present(signNC, animated: true, completion: nil)
    }
}

//MARK: - Layout
extension NavigationBarView {
    func makeLayout() {
        self.addSubviews([mainIconImage, windowSharingBtn, notificationBtn, searchBtn, profileBtn])
        
        mainIconImage.snp.makeConstraints {
            $0.top.equalTo(self).offset(12)
            $0.leading.equalTo(self).offset(16)
            $0.height.equalTo(20)
            $0.width.equalTo(96)
        }
        
        profileBtn.snp.makeConstraints {
            $0.trailing.equalTo(self).offset(-16)
            $0.height.equalTo(24)
            $0.width.equalTo(profileBtn.snp.height).multipliedBy(1.0 / 1.0)
            $0.centerY.equalTo(mainIconImage)
        }
        
        searchBtn.snp.makeConstraints {
            $0.trailing.equalTo(profileBtn.snp.leading).offset(-17)
            $0.height.equalTo(32)
            $0.width.equalTo(searchBtn.snp.height).multipliedBy(1.0 / 1.0)
            $0.centerY.equalTo(profileBtn)
        }
        
        notificationBtn.snp.makeConstraints {
            $0.trailing.equalTo(searchBtn.snp.leading).offset(-11)
            $0.height.equalTo(32)
            $0.width.equalTo(notificationBtn.snp.height).multipliedBy(1.0 / 1.0)
            $0.centerY.equalTo(searchBtn)
        }
        
        windowSharingBtn.snp.makeConstraints {
            $0.trailing.equalTo(notificationBtn.snp.leading).offset(-12)
            $0.height.equalTo(32)
            $0.width.equalTo(windowSharingBtn.snp.height).multipliedBy(1.0 / 1.0)
            $0.centerY.equalTo(notificationBtn)
        }
    }
}
