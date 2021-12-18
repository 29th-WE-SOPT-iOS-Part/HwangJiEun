//
//  ViewController.swift
//  Seminar8
//
//  Created by 황지은 on 2021/12/18.
//

import UIKit
import Lottie

class ViewController: UIViewController {

    @IBOutlet var targetView: UIView!
    var animator: UIViewPropertyAnimator?
    lazy var lottieView: AnimationView = {
        let animationView = AnimationView(name: "seminar8-sample")
        animationView.frame = CGRect(x: 0, y: 0, width: 300, height: 300)
        animationView.center = self.view.center
        animationView.contentMode = .scaleAspectFit
        animationView.stop()
        animationView.isHidden = true
        return animationView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initAnimator()
        view.addSubview(lottieView)
    }
    
    func initAnimator() {
        animator = UIViewPropertyAnimator(duration: 3, curve: .easeInOut) {
            self.targetView.frame = CGRect(x: self.view.center.x - 50, y: self.view.center.y - 50, width: 100, height: 100)
            
        }
        animator?.addAnimations {
            self.targetView.backgroundColor = .orange
        }
        animator?.addCompletion { position in
            print(position.rawValue)
            print("completion 블록 호출됨")
        }
        animator?.addCompletion {
            print($0.rawValue)
            print("completion 블록 호출됨")
        }
    }
    
    @IBAction func touchUpToStartAnimation(_ sender: UIButton) {
//        animator?.startAnimation()
//        animator?.addAnimations {
//            print("새로운 애니메이션 추가")
//        }
        lottieView.isHidden = false
        lottieView.play()
    }
    
    @IBAction func touchUpToPauseAnimation(_ sender: UIButton) {
//        animator?.pauseAnimation()
        lottieView.pause()
    }
    
    @IBAction func touchUpToStopAnimation(_ sender: UIButton) {
//        animator?.stopAnimation(true)
//        animator?.stopAnimation(false)
//        animator?.finishAnimation(at: .current)
        lottieView.stop()
    }
    
}

