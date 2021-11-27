//
//  FirstVC.swift
//  Seminar7
//
//  Created by 황지은 on 2021/11/27.
//

import UIKit

class FirstVC: UIViewController {

    static let identifier = "FirstVC"
    @IBOutlet var firstTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func sendDataDidTap(_ sender: UIButton) {
        guard let nextVC = storyboard?.instantiateViewController(withIdentifier: SecondVC.identifier) as? SecondVC else { return }
        nextVC.receivedText = firstTextField.text ?? ""
//        performSegue(withIdentifier: "presentSecondVC", sender: sender)
        NotificationCenter.default.addObserver(self, selector: #selector(dataReceived), name: NSNotification.Name("iOS-Sample"), object: nil)
        present(nextVC, animated: true, completion: nil)
    }
    
    @objc func dataReceived(notification: NSNotification) {
        if let text = notification.object as? String {
            firstTextField.text = text
        }
    }
    
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        if segue.identifier == "presentSecondVC" {
//            let nextVC = segue.destination as? SecondVC
//            nextVC?.receivedText = firstTextField.text ?? ""
//        }
//    }
}
