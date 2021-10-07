//
//  SignInVC.swift
//  29th_Assign_Youtube_Clone
//
//  Created by 황지은 on 2021/10/07.
//

import UIKit

class SignInVC: UIViewController {

    @IBOutlet var nameTextField: UITextField!
    @IBOutlet var emailPhoneTextField: UITextField!
    @IBOutlet var pwTextField: UITextField!
    @IBOutlet var signUpBtn: UIButton!
    @IBOutlet var signInBtn: UIButton!
    
    var userName: String?
    var userEmailPhone: String?
    var userPassword: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setTextFieldBorderStyle(1)
        setTextFieldFontSize(16)
        addLeftPaddingInTextField()
        setTextFieldPlaceholder()
        setBtnAttributes()
    }
    
    /// TextField Border Styling
    func setTextFieldBorderStyle(_ size: CGFloat) {
        nameTextField.borderStyle = .none
        emailPhoneTextField.borderStyle = .none
        pwTextField.borderStyle = .none
        
        nameTextField.layer.borderWidth = size
        emailPhoneTextField.layer.borderWidth = size
        pwTextField.layer.borderWidth = size
        
        nameTextField.layer.cornerRadius = 10
        emailPhoneTextField.layer.cornerRadius = 10
        pwTextField.layer.cornerRadius = 10
        
        nameTextField.layer.borderColor = UIColor.lightGray.cgColor
        emailPhoneTextField.layer.borderColor = UIColor.lightGray.cgColor
        pwTextField.layer.borderColor = UIColor.lightGray.cgColor
    }
    
    /// TextField Font Size 변경
    func setTextFieldFontSize(_ size: CGFloat) {
        nameTextField.font = UIFont.systemFont(ofSize: size)
        emailPhoneTextField.font = UIFont.systemFont(ofSize: size)
        pwTextField.font = UIFont.systemFont(ofSize: size)
    }
    
    /// TextField addLeftPadding
    func addLeftPaddingInTextField() {
        nameTextField.addLeftPadding()
        emailPhoneTextField.addLeftPadding()
        pwTextField.addLeftPadding()
    }
    
    /// TextField Placeholder 설정
    func setTextFieldPlaceholder() {
        nameTextField.placeholder = "이름을 입력해주세요."
        emailPhoneTextField.placeholder = "이메일 또는 휴대전화"
        pwTextField.placeholder = "비밀번호 입력"
    }
    
    /// Button 속성 설정 (titleLabel, color, cornerRadius)
    func setBtnAttributes() {
        //signUpBtn
        signUpBtn.setTitle("계정만들기", for: .normal)
        signUpBtn.titleLabel?.font = UIFont.systemFont(ofSize: 15)
        signUpBtn.titleLabel?.textColor = .googleBlue
        
        //signInBtn
        signInBtn.setTitle("다음", for: .normal)
        signInBtn.titleLabel?.font = UIFont.boldSystemFont(ofSize: 15)
        signInBtn.backgroundColor = .googleBlue
        signInBtn.titleLabel?.tintColor = .white
        signInBtn.layer.cornerRadius = 10
    }
    
    /// signUpBtnDidTap
    @IBAction func signUpBtnDidTap(_ sender: UIButton) {
    }
    
    /// signInBtnDidTap
    @IBAction func signInBtnDidTap(_ sender: UIButton) {
    }
}
