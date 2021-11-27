//
//  GestureVC.swift
//  Seminar7
//
//  Created by 황지은 on 2021/11/27.
//

import UIKit

class GestureVC: UIViewController {
    
    static let identifier = "GestureVC"
    @IBOutlet var tapGestureTestView: UIView!
    let colors = [
        UIColor.red,
        UIColor.orange,
        UIColor.yellow,
        UIColor.green,
        UIColor.systemBlue,
        UIColor.systemPurple,
        UIColor.white,
        UIColor.black,
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        makeGestureRecognizer()
    }
    
    func makeGestureRecognizer() {
        let tapRecognizer = UITapGestureRecognizer(target: self, action: #selector(tapView(gestureRecognizer:)))
        
        let tapRecognizer2 = UITapGestureRecognizer()
        tapRecognizer2.addTarget(self, action: #selector(tapView(gestureRecognizer:)))
        
        tapGestureTestView.addGestureRecognizer(tapRecognizer)
    }
    
    @objc func tapView(gestureRecognizer: UIGestureRecognizer) {
        print("뷰 안에서 tap")
        
        let randColor = GestureVC().randomColorGenerator()
        tapGestureTestView.backgroundColor = colors[randColor]
    }
    
    func randomColorGenerator() -> Int{
        let randomColor = Int(arc4random_uniform(4))
        return randomColor
    }
}
