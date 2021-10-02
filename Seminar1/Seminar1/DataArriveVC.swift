//
//  DataArriveVC.swift
//  Seminar1
//
//  Created by 황지은 on 2021/10/02.
//

import UIKit

class DataArriveVC: UIViewController {

    @IBOutlet var arriveDataLabel: UILabel!
    var message: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setMessageInLabel()
    }
    
    func setMessageInLabel() {
        if let msg = message {
            arriveDataLabel.text = msg
            arriveDataLabel.sizeToFit()
        }
    }

    @IBAction func touchUpToBackView(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
}
