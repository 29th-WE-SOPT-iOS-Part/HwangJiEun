//
//  SignUpVC.swift
//  29th_Assign_Youtube_Clone
//
//  Created by 황지은 on 2021/10/07.
//

import UIKit

class SignUpVC: UIViewController {
    
    static let identifier = "SignUpVC"
    
    @IBOutlet var signUpNameTextField: UITextField! {
        didSet {
            signUpNameTextField.delegate = self
        }
    }
    @IBOutlet var signUpEmailPhoneTextField: UITextField! {
        didSet {
            signUpEmailPhoneTextField.delegate = self
        }
    }
    @IBOutlet var signUpPwTextField: UITextField! {
        didSet {
            signUpPwTextField.delegate = self
        }
    }
    @IBOutlet var pwAppearBtn: UIButton!
    @IBOutlet var signUpBtn: UIButton!
    @IBOutlet var signUpNameTextFieldTopConstraint: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setTextFieldBorderStyle(borderWidth: 1, cornerRadius: 10)
        setTextFieldFontSize(fontSize: 16)
        addLeftPaddingInTextField()
        setTextFieldPlaceholder()
        setPwAppearBtnAttributes(borderWidth: 2, cornerRadius: 5)
        setSignUpBtnAttributes(fontSize: 15, cornerRadius: 10)
        setSignUpBtnState()
        textFieldEditingCheck()
        keyboardObserver()
    }
    
    //MARK: - UI
    /// TextField Border Styling
    func setTextFieldBorderStyle(borderWidth: CGFloat, cornerRadius: CGFloat) {
        signUpNameTextField.borderStyle = .none
        signUpEmailPhoneTextField.borderStyle = .none
        signUpPwTextField.borderStyle = .none
        
        signUpNameTextField.layer.borderWidth = borderWidth
        signUpEmailPhoneTextField.layer.borderWidth = borderWidth
        signUpPwTextField.layer.borderWidth = borderWidth
        
        signUpNameTextField.layer.cornerRadius = cornerRadius
        signUpEmailPhoneTextField.layer.cornerRadius = cornerRadius
        signUpPwTextField.layer.cornerRadius = cornerRadius
        
        signUpNameTextField.layer.borderColor = UIColor.lightGray.cgColor
        signUpEmailPhoneTextField.layer.borderColor = UIColor.lightGray.cgColor
        signUpPwTextField.layer.borderColor = UIColor.lightGray.cgColor
    }
    
    /// TextField Font Size 변경
    func setTextFieldFontSize(fontSize: CGFloat) {
        signUpNameTextField.font = UIFont.systemFont(ofSize: fontSize)
        signUpEmailPhoneTextField.font = UIFont.systemFont(ofSize: fontSize)
        signUpPwTextField.font = UIFont.systemFont(ofSize: fontSize)
    }
    
    /// TextField addLeftPadding
    func addLeftPaddingInTextField() {
        signUpNameTextField.addLeftPadding()
        signUpEmailPhoneTextField.addLeftPadding()
        signUpPwTextField.addLeftPadding()
    }
    
    /// TextField Placeholder 설정
    func setTextFieldPlaceholder() {
        signUpNameTextField.placeholder = "이름을 입력해주세요."
        signUpEmailPhoneTextField.placeholder = "이메일 또는 휴대전화"
        signUpPwTextField.placeholder = "비밀번호 입력"
    }
    
    /// appearPwBtn Attributes 설정
    func setPwAppearBtnAttributes(borderWidth: CGFloat, cornerRadius: CGFloat) {
        pwAppearBtn.layer.borderWidth = borderWidth
        pwAppearBtn.layer.cornerRadius = cornerRadius
        pwAppearBtn.layer.borderColor = UIColor.lightGray.cgColor
        pwAppearBtn.imageView!.contentMode = .scaleAspectFit
        pwAppearBtn.contentVerticalAlignment = .fill
        pwAppearBtn.contentHorizontalAlignment = .fill
    }
    
    /// signUpBtn Attributes 설정
    func setSignUpBtnAttributes(fontSize: CGFloat, cornerRadius: CGFloat) {
        signUpBtn.setTitle("다음", for: .normal)
        signUpBtn.titleLabel?.font = UIFont.boldSystemFont(ofSize: fontSize)
        signUpBtn.titleLabel?.tintColor = .white
        signUpBtn.backgroundColor = .googleBlue
        signUpBtn.layer.cornerRadius = cornerRadius
    }
    
    /// SignUpBtn 초기상태 설정함수
    func setSignUpBtnState() {
        signUpBtn.isEnabled = false
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
            signUpNameTextFieldTopConstraint.constant = 50
            
            // 키보드가 올라감에 따라 뷰의 프레임을 -10 올려 텍스트필드의 입력상태가 보이게 UI를 구성했습니다.
            if self.view.frame.origin.y == 0 {
                self.view.frame.origin.y -= 10
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
        if signUpNameTextFieldTopConstraint.constant != 138.5 {
            signUpNameTextFieldTopConstraint.constant = 138.5
        }
    }
    
    /// touchesBegan - 뷰의 다른 곳 탭하면 키보드 내리기
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) { self.view.endEditing(true)
    }
    
    //MARK: - IBAction
    /// appearBtnDidTap - 비밀번호 표시 버튼 눌렀을 때
    @IBAction func pwAppearBtnDidTap(_ sender: UIButton) {
        sender.isSelected.toggle()
        
        // 비밀번호 암호화 체크 선택, 해제
        if sender.isSelected {
            signUpPwTextField.isSecureTextEntry = false
        }
        else {
            signUpPwTextField.isSecureTextEntry = true
        }
    }
    
    /// signUpBtnDidTap - 다음 버튼 눌렀을 때
    @IBAction func signUpBtnDidTap(_ sender: UIButton) {
        guard let confirmVC = self.storyboard?.instantiateViewController(withIdentifier: SignConfirmVC.identifier) as? SignConfirmVC else { return }
        
        confirmVC.userName = signUpNameTextField.text
        
        confirmVC.modalPresentationStyle = .fullScreen
        self.present(confirmVC, animated: true, completion: nil)
    }
}

//MARK: - UITextFieldDelegate
extension SignUpVC: UITextFieldDelegate {
    
    @objc func handleTapTextField(_ sender: UITapGestureRecognizer) {
        self.signUpNameTextField.resignFirstResponder()
        self.signUpEmailPhoneTextField.resignFirstResponder()
        self.signUpPwTextField.resignFirstResponder()
    }
    
    /// textFieldShouldReturn - 키보드 return 눌렀을 때 Action
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        // 키보드에서 return 눌렀을 때 다음 textField로 이동합니다.
        if textField == signUpNameTextField {
            signUpEmailPhoneTextField.becomeFirstResponder()
        }
        else if textField == signUpEmailPhoneTextField {
            signUpPwTextField.becomeFirstResponder()
        }
        textField.resignFirstResponder()
        return true
    }
    
    /// textFieldEditingCheck - TextField 입력 체크하는 함수
    private func textFieldEditingCheck() {
        
        // 텍스트 입력중일 때 함수가 동작하게끔 textField에 타겟을 추가해줍니다.
        signUpNameTextField.addTarget(self, action: #selector(nameTextIsEditing(_:)), for: .editingChanged)
        signUpEmailPhoneTextField.addTarget(self, action: #selector(emailPhoneTextIsEditing(_:)), for: .editingChanged)
        signUpPwTextField.addTarget(self, action: #selector(pwTextIsEditing(_:)), for: .editingChanged)
    }
    
    /// nameTextIsEditing - nameTextField 입력중일 때
    // name,emailPhone,pw TextField가 입력중일 때 TextField의 텍스트 수를 체크합니다.
    // 만약 세 TextField에 모두 텍스트가 입력되었다면 signUpBtn을 활성화시킵니다.
    @objc func nameTextIsEditing(_ TextLabel: UITextField) {
       
        if signUpNameTextField.hasText && signUpEmailPhoneTextField.hasText && signUpPwTextField.hasText {
            signUpBtn.isEnabled = true
        }
        else {
            signUpBtn.isEnabled = false
        }
    }
    
    /// emailPhoneTextIsEditing - emailPhoneTextField 입력중일 때
    @objc func emailPhoneTextIsEditing(_ TextLabel: UITextField) {
        
        if signUpNameTextField.hasText && signUpEmailPhoneTextField.hasText && signUpPwTextField.hasText {
            signUpBtn.isEnabled = true
        }
        else {
            signUpBtn.isEnabled = false
        }
    }
    
    /// pwTextIsEditing - pwTextField 입력중일 때
    @objc func pwTextIsEditing(_ TextLabel: UITextField) {
        
        if signUpNameTextField.hasText && signUpEmailPhoneTextField.hasText && signUpPwTextField.hasText {
            signUpBtn.isEnabled = true
        }
        else {
            signUpBtn.isEnabled = false
        }
    }
}
