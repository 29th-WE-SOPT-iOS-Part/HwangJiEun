//
//  DataOriginVC.swift
//  Seminar1
//
//  Created by 황지은 on 2021/10/02.
//

import UIKit

class DataOriginVC: UIViewController {
    
    @IBOutlet var dataTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func touchUpSendDataToNextVC(_ sender: UIButton) {
        
        guard let dataArriveVC = self.storyboard?.instantiateViewController(withIdentifier: "DataArriveVC") as? DataArriveVC else { return }
        
        dataArriveVC.message = dataTextField.text
        dataArriveVC.modalPresentationStyle = .fullScreen
        self.present(dataArriveVC, animated: true, completion: nil)
    }
}
