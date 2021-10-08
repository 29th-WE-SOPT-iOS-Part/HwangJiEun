//
//  SignConfirmVC.swift
//  29th_Assign_Youtube_Clone
//
//  Created by 황지은 on 2021/10/07.
//

import UIKit

class SignConfirmVC: UIViewController {
    
    static let identifier = "SignConfirmVC"
    var userName: String?

    @IBOutlet var userWelcomeLabel: UILabel!
    @IBOutlet var confirmBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUserWelcomeLabelText()
        setConfirmBtnAttributes(fontSize: 15, cornerRadius: 10)
    }
    
    /// userName 전달받아 구성하는 함수
    func setUserWelcomeLabelText() {
        if let user = userName {
            userWelcomeLabel.text = "\(user)님 \n환영합니다!"
            userWelcomeLabel.sizeToFit()
        }
    }

    /// confirmBtn Attributes 설정
    func setConfirmBtnAttributes(fontSize: CGFloat, cornerRadius: CGFloat) {
        confirmBtn.setTitle("확인", for: .normal)
        confirmBtn.titleLabel?.font = UIFont.boldSystemFont(ofSize: fontSize)
        confirmBtn.titleLabel?.tintColor = .white
        confirmBtn.backgroundColor = .googleBlue
        confirmBtn.layer.cornerRadius = cornerRadius
    }
    
    @IBAction func dismissBtnDidTap(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
}
