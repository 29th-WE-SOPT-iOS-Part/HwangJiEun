//
//  ViewController.swift
//  Seminar1
//
//  Created by 황지은 on 2021/10/02.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var teamLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        teamLabel.isHidden = true
        // Do any additional setup after loading the view.
    }

    @IBAction func touchUpToShowTeamLabel(_ sender: UIButton) {
        teamLabel.isHidden = false
        titleLabel.text = "WE SOPT 1차 세미나"
        teamLabel.sizeToFit()
        titleLabel.sizeToFit()
    }
    
    @IBAction func touchUpToPushSecondVC(_ sender: UIButton) {
        
        guard let secondVC = self.storyboard?.instantiateViewController(withIdentifier: "SecondVC") else { return }
        
//        secondVC.modalPresentationStyle = .fullScreen
//        secondVC.modalTransitionStyle = .crossDissolve
//        self.present(secondVC, animated: true, completion: nil)
        self.navigationController?.pushViewController(secondVC, animated: true)
    }
}

