//
//  SignInVC.swift
//  29th_Assign_Youtube_Clone
//
//  Created by 황지은 on 2021/10/07.
//

import UIKit

class SignInVC: UIViewController {
    
    @IBOutlet var signInTopView: SignTopReusableView! {
        didSet {
            signInTopView.setTextLabelFontStyle(.signIn, "로그인", "Youtube로 이동하여 계속하세요.\n앱 및 Safari에서도 Google 서비스에 로그인됩니다.")
        }
    }
    @IBOutlet var nameTextField: UITextField! {
        didSet {
            nameTextField.delegate = self
        }
    }
    @IBOutlet var emailPhoneTextField: UITextField! {
        didSet {
            emailPhoneTextField.delegate = self
        }
    }
    @IBOutlet var pwTextField: UITextField! {
        didSet {
            pwTextField.delegate = self
        }
    }
    @IBOutlet var signUpBtn: UIButton!
    @IBOutlet var signInBtn: UIButton! {
        didSet {
            signInBtn.setBackgroundColor(.googleLightGray, for: .disabled)
        }
    }
    @IBOutlet var signInNameTextFieldTopConstraint: NSLayoutConstraint!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setTextFieldBorderStyle(borderWidth: 1, cornerRadius: 8, borderColor: .googleLightGray)
        setTextFieldFontStyle(customFont: "SFProDisplay-Regular", fontSize: 15)
        addLeftPaddingInTextField()
        setTextFieldPlaceholder()
        setBtnAttributes(fontSize: 15)
        setSignInBtnState()
        textFieldEditingCheck()
        keyboardObserver()
    }
    
    /// TextField Border Styling
    func setTextFieldBorderStyle(borderWidth: CGFloat, cornerRadius: CGFloat, borderColor: UIColor) {
        
        nameTextField.borderStyle = .none
        nameTextField.layer.borderWidth = borderWidth
        nameTextField.layer.cornerRadius = cornerRadius
        nameTextField.layer.borderColor = borderColor.cgColor
        
        
        emailPhoneTextField.borderStyle = .none
        emailPhoneTextField.layer.borderWidth = borderWidth
        emailPhoneTextField.layer.cornerRadius = cornerRadius
        emailPhoneTextField.layer.borderColor = borderColor.cgColor
        
        pwTextField.borderStyle = .none
        pwTextField.layer.borderWidth = borderWidth
        pwTextField.layer.cornerRadius = cornerRadius
        pwTextField.layer.borderColor = borderColor.cgColor
    }

    /// TextField Font Style 설정
    func setTextFieldFontStyle(customFont: String, fontSize: CGFloat) {
        nameTextField.font = UIFont(name: customFont, size: fontSize)
        emailPhoneTextField.font = UIFont(name: customFont, size: fontSize)
        pwTextField.font = UIFont(name: customFont, size: fontSize)
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
    func setBtnAttributes(fontSize: CGFloat) {
        //signUpBtn
        signUpBtn.setTitle("계정만들기", for: .normal)
        signUpBtn.titleLabel?.font = UIFont.systemFont(ofSize: fontSize)
        signUpBtn.titleLabel?.textColor = .googleBlue
        
        //signInBtn
        
        signInBtn.setTitle("다음", for: .normal)
        signInBtn.titleLabel?.font = UIFont.boldSystemFont(ofSize: fontSize)
        signInBtn.backgroundColor = .googleBlue
        signInBtn.titleLabel?.tintColor = .white
        signInBtn.layer.cornerRadius = 10
    }
    
    /// SignInBtn 초기상태 설정함수
    func setSignInBtnState() {
        signInBtn.isEnabled = false
    }
    
    //MARK: - Keyboard Action
    /// KeyboardObserver 함수
    func keyboardObserver(){
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(_:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillDisappear(_:)), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    /// keyboardWillShow - 키보드 올라올 때
    @objc func keyboardWillShow(_ notification: NSNotification) {
        
        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
            
            // 키보드가 올라감에 따라 회원가입Label <-> signUpNameTextField간의 constraint 간격을 좁혀주었습니다.
            signInNameTextFieldTopConstraint.constant = 30
            
            // 키보드가 올라감에 따라 뷰의 프레임을 -10 올려 텍스트필드의 입력상태가 보이게 UI를 구성했습니다.
            if self.view.frame.origin.y == 0 {
                self.view.frame.origin.y -= 20
            }
        }
    }
    
    /// keyboardWillDisappear - 키보드 내려갈 때
    @objc func keyboardWillDisappear(_ notification: NSNotification) {
        // 키보드가 내려감에 따라 뷰의 프레임을 0으로 되돌려 기존 UI의 원상태로 되돌려줍니다.
        if self.view.frame.origin.y != 0 {
            self.view.frame.origin.y = 0
        }
        
        // 키보드가 내려감에 따라 회원가입Label <-> signUpNameTextField간의 constraint 간격을 기존대로 설정해주었습니다.
        if signInNameTextFieldTopConstraint.constant != 87.5 {
            signInNameTextFieldTopConstraint.constant = 87.5
        }
    }
    
    /// touchesBegan - 뷰의 다른 곳 탭하면 키보드 내리기
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    //MARK: - IBAction
    /// signUpBtnDidTap - 계정만들기 버튼 눌렀을 때
    @IBAction func signUpBtnDidTap(_ sender: UIButton) {
        guard let signUpVC = self.storyboard?.instantiateViewController(withIdentifier: SignUpVC.identifier) as? SignUpVC else { return }
        self.navigationController?.pushViewController(signUpVC, animated: true)
    }
    
    /// signInBtnDidTap - 다음 버튼 눌렀을 때
    @IBAction func signInBtnDidTap(_ sender: UIButton) {
        guard let confirmVC = self.storyboard?.instantiateViewController(withIdentifier: SignConfirmVC.identifier) as? SignConfirmVC else { return }
        
        confirmVC.userName = nameTextField.text
        
        confirmVC.modalPresentationStyle = .fullScreen
        self.present(confirmVC, animated: true, completion: nil)
    }
}

//MARK: - UITextFieldDelegate
extension SignInVC: UITextFieldDelegate {
    
    @objc func handleTapTextField(_ sender: UITapGestureRecognizer) {
        self.nameTextField.resignFirstResponder()
        self.emailPhoneTextField.resignFirstResponder()
        self.pwTextField.resignFirstResponder()
    }
    
    /// textFieldShouldReturn - 키보드 return 눌렀을 때 Action
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        // 키보드에서 return 눌렀을 때 다음 textField로 이동합니다.
        if textField == nameTextField {
            emailPhoneTextField.becomeFirstResponder()
        }
        else if textField == emailPhoneTextField {
            pwTextField.becomeFirstResponder()
        }
        textField.resignFirstResponder()
        return true
    }
    
    /// TextField 입력 체크하는 함수
    private func textFieldEditingCheck() {
        
        /// 텍스트 입력 끝났을 때 동작
        nameTextField.addTarget(self, action: #selector(nameTextIsEditing(_:)), for: .editingChanged)
        emailPhoneTextField.addTarget(self, action: #selector(emailPhoneTextIsEditing(_:)), for: .editingChanged)
        pwTextField.addTarget(self, action: #selector(pwTextIsEditing(_:)), for: .editingChanged)
    }
    
    /// nameTextField 입력중일 때
    // name,emailPhone,pw TextField가 입력중일 때 TextField의 텍스트 수를 체크합니다.
    // 만약 세 TextField에 모두 텍스트가 입력되었다면 signInBtn을 활성화시킵니다.
    @objc func nameTextIsEditing(_ TextLabel: UITextField) {
       
        if nameTextField.hasText && emailPhoneTextField.hasText && pwTextField.hasText {
            signInBtn.isEnabled = true
        }
        else {
            signInBtn.isEnabled = false
        }
    }
    
    /// emailPhoneTextField 입력중일 때
    @objc func emailPhoneTextIsEditing(_ TextLabel: UITextField) {
        
        if nameTextField.hasText && emailPhoneTextField.hasText && pwTextField.hasText {
            signInBtn.isEnabled = true
        }
        else {
            signInBtn.isEnabled = false
        }
    }
    
    /// pwTextField 입력중일 때
    @objc func pwTextIsEditing(_ TextLabel: UITextField) {
        
        if nameTextField.hasText && emailPhoneTextField.hasText && pwTextField.hasText {
            signInBtn.isEnabled = true
        }
        else {
            signInBtn.isEnabled = false
        }
    }
}
