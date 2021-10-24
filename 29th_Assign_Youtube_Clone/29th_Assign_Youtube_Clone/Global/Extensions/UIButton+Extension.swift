//
//  UIButton+Extension.swift
//  29th_Assign_Youtube_Clone
//
//  Created by 황지은 on 2021/10/22.
//

import UIKit
extension UIButton {
    /// UIButton의 State에 따라 backgroundColor를 변경하는 함수입니다.
    func setBackgroundColor(_ color: UIColor, for state: UIControl.State) {
        let minimumSize: CGSize = CGSize(width: 1.0, height: 1.0)
        
        UIGraphicsBeginImageContext(minimumSize)
        
        if let context = UIGraphicsGetCurrentContext() {
            context.setFillColor(color.cgColor)
            context.fill(CGRect(origin: .zero, size: minimumSize))
        }
        
        let colorImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        self.clipsToBounds = true
        self.setBackgroundImage(colorImage, for: state)
    }
}
