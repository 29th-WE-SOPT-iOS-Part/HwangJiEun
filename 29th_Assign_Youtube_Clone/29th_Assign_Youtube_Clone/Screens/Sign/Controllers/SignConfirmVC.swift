//
//  SignConfirmVC.swift
//  29th_Assign_Youtube_Clone
//
//  Created by 황지은 on 2021/10/07.
//

import UIKit

class SignConfirmVC: UIViewController {
    
    var userName: String?
    
    @IBOutlet var signConfirmTopView: SignTopReusableView! {
        didSet {
            //userDefaults에 저장된 userName값을 이용하여 confirmView의 userName값 설정
            if let user = UserDefaults.standard.string(forKey: UserDefaults.Keys.loginUserName) {
                signConfirmTopView.setTextLabelFontStyle(.welcome, user, "")
            }
        }
    }
    @IBOutlet var confirmBtn: UIButton!
    @IBOutlet var otherAccountBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setConfirmBtnAttributes(fontSize: 14, cornerRadius: 10)
        setOtherAccountBtnAttributes(fontSize: 14)
    }
    
    /// confirmBtn Attributes 설정
    func setConfirmBtnAttributes(fontSize: CGFloat, cornerRadius: CGFloat) {
        confirmBtn.setTitle("확인", for: .normal)
        confirmBtn.titleLabel?.font = UIFont(name: "SFProDisplay-Medium", size: fontSize)
        confirmBtn.titleLabel?.tintColor = .white
        confirmBtn.backgroundColor = .googleBlue
        confirmBtn.layer.cornerRadius = cornerRadius
    }
    
    func setOtherAccountBtnAttributes(fontSize: CGFloat) {
        //signUpBtn
        otherAccountBtn.setTitle("다른 계정으로 로그인하기", for: .normal)
        otherAccountBtn.titleLabel?.font = UIFont(name: "SFProDisplay-Medium", size: fontSize)
        otherAccountBtn.titleLabel?.textColor = .googleBlue
    }
    
    @IBAction func confirmBtnDidTap(_ sender: UIButton) {
       // 탭바VC로 이동 -> Modal 2번 한꺼번에 dismiss
        self.presentingViewController?.presentingViewController?.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func otherAccountBtnDidTap(_ sender: UIButton) {
        // 로그인 화면으로 dismiss
        self.dismiss(animated: true, completion: nil)
    }
}
