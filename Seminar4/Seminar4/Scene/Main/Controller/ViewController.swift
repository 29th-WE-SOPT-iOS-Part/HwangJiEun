//
//  ViewController.swift
//  Seminar4
//
//  Created by 황지은 on 2021/10/30.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var emailTextField: UITextField!
    @IBOutlet var pwTextField: UITextField!
    @IBOutlet var userNameLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func loginBtnDidTap(_ sender: UIButton) {
        requestLogin()
    }
    
    func simpleAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "확인", style: .default)
        alert.addAction(okAction)
        present(alert, animated: true, completion: nil)
    }
}

extension ViewController {
    func requestLogin() {
        LoginService.shared.login(email: emailTextField.text ?? "", password: pwTextField.text ?? "") { [self] responseData in
            switch responseData {
            case .success(let loginResponse):
                guard let response = loginResponse as? LoginResponseData else { return }
                if let userData = response.data {
                    self.simpleAlert(title: response.message, message: "\(userData.name)님 환영합니다")
                    reguestUserInfo(userData: userData.id)
                }
            case .requestErr(let msg):
                print("requestErr \(msg)")
            case .pathErr: 
                print("pathErr")
            case .serverErr:
                print("serverErr")
            case .networkFail:
                print("networkFail")
            }
            
        }
    }
    
    func reguestUserInfo(userData: Int) {
        LoginService.shared.getUser(userId: userData) { responseData in
            switch responseData {
            case .success(let userResponse):
                guard let response = userResponse as? LoginResponseData else { return }
                if let userData = response.data {
                    self.userNameLabel.text = userData.name
                }
            case .requestErr(let msg):
                print("requestErr \(msg)")
            case .pathErr:
                print("pathErr")
            case .serverErr:
                print("serverErr")
            case .networkFail:
                print("networkFail")
            }
        }
    }
}
