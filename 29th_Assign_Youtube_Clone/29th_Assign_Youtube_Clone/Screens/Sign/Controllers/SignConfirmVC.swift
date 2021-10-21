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
    
    @IBOutlet var signConfirmTopView: SignTopReusableView! {
        didSet {
            if let user = userName {
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
       // 탭바VC로 이동
        let tabBarSB = UIStoryboard.init(name: "TabBar", bundle: nil)
        guard let tabBarVC = tabBarSB.instantiateViewController(identifier: YoutubeTBC.identifier) as? YoutubeTBC else { return }
        
        tabBarVC.modalPresentationStyle = .fullScreen
        self.present(tabBarVC, animated: true, completion: nil)
    }
    
    @IBAction func otherAccountBtnDidTap(_ sender: UIButton) {
        // 로그인 화면으로 dismiss
        self.dismiss(animated: true, completion: nil)
    }
}
