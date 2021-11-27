//
//  UIViewController+Extension.swift
//  29th_Assign_Youtube_Clone
//
//  Created by 황지은 on 2021/11/11.
//

import UIKit
extension UIViewController {
    func showAlert(alertText : String, alertMessage : String, isSuccess: Bool, vc: UIViewController) {
        let alert = UIAlertController(title: alertText, message: alertMessage, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "확인", style: .default) { (_) in
            // okAction누를 때 -> 서버통신 성공시에만 vc를 present
            if isSuccess {
                vc.modalPresentationStyle = .fullScreen
                self.present(vc, animated: true, completion: {
                    self.navigationController?.popToRootViewController(animated: true)
                })
            }
        }
        alert.addAction(okAction)
        self.present(alert, animated: true, completion: nil)
    }
}
