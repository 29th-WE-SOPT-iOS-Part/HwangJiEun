//
//  SignTopReusableView.swift
//  29th_Assign_Youtube_Clone
//
//  Created by 황지은 on 2021/10/22.
//

import UIKit

enum SignState {
    case signIn, signUp, welcome
}

class SignTopReusableView: UIView {
    
    let xibName = "SignTopReusableView"
    let userDisplayInterfaceStyle = UITraitCollection.current.userInterfaceStyle
    
    @IBOutlet var signHeadTextLabel: UILabel!
    @IBOutlet var signDescTextLabel: UILabel!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    ///Label Font Style Setting
    func setTextLabelFontStyle(_ division: SignState, _ headText: String, _ descText: String) {
        //signHeadTextLabel
        signHeadTextLabel.font = UIFont(name: "SFProDisplay-Semibold", size: 24)
        signHeadTextLabel.text = headText
        signHeadTextLabel.numberOfLines = 0
        signHeadTextLabel.textAlignment = .center
        signHeadTextLabel.sizeToFit()
        
        //signDescTextLabel
        signDescTextLabel.font = UIFont(name: "SFProDisplay-Regular", size: 14)
        signDescTextLabel.text = descText
        signDescTextLabel.numberOfLines = 0
        signDescTextLabel.textAlignment = .center
        signDescTextLabel.sizeToFit()
        
        //다크모드, 라이트모드에 따른 textColor변경
        if userDisplayInterfaceStyle == .dark {
            //다크모드
            signHeadTextLabel.textColor = .white
            signDescTextLabel.textColor = .white
        }
        else {
            //라이트모드
            signHeadTextLabel.textColor = .googleDarkGray
            signDescTextLabel.textColor = .googleDarkGray
        }
        
        switch division {
        case .signIn:
            signDescTextLabel.isHidden = false
        case .signUp:
            signDescTextLabel.isHidden = true
        case .welcome:
            signDescTextLabel.isHidden = true
            signHeadTextLabel.font = UIFont(name: "SFProDisplay-Semibold", size: 26)
            signHeadTextLabel.text = headText + "님 \n환영합니다!"
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    private func commonInit() {
        let view = Bundle.main.loadNibNamed(xibName, owner: self, options: nil)?.first as! UIView
        view.frame = self.bounds
        self.addSubview(view)
    }
}
