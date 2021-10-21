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
    
    @IBOutlet var signHeadTextLabel: UILabel!
    @IBOutlet var signDescTextLabel: UILabel!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    func setTextLabelFontStyle(_ division: SignState, _ headText: String, _ descText: String) {
        //signHeadTextLabel
        signHeadTextLabel.font = UIFont(name: "SFProDisplay-Semibold", size: 24)
        signHeadTextLabel.textColor = .googleDarkGray
        signHeadTextLabel.text = headText
        signHeadTextLabel.numberOfLines = 0
        signHeadTextLabel.textAlignment = .center
        signHeadTextLabel.sizeToFit()
        
        //signDescTextLabel
        signDescTextLabel.font = UIFont(name: "SFProDisplay-Regular", size: 14)
        signDescTextLabel.textColor = .googleDarkGray
        signDescTextLabel.text = descText
        signDescTextLabel.numberOfLines = 0
        signDescTextLabel.textAlignment = .center
        signDescTextLabel.sizeToFit()
        
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
