//
//  SecondVC.swift
//  Seminar7
//
//  Created by 황지은 on 2021/11/27.
//

import UIKit

class SecondVC: UIViewController {

    static let identifier = "SecondVC"
    var receivedText = ""
    @IBOutlet var secondTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        secondTextField.text = receivedText
    }
    
    @IBAction func sendDataDidTap(_ sender: UIButton) {
        
        NotificationCenter.default.post(name: NSNotification.Name("iOS-Sample"), object: secondTextField.text ?? "")
        let presentingVC = presentingViewController as? FirstVC
        presentingVC?.firstTextField.text = secondTextField.text
        dismiss(animated: true, completion: nil)
    }
    
    func setDataInTextField(data: String) {
        secondTextField.text = data
    }
}
