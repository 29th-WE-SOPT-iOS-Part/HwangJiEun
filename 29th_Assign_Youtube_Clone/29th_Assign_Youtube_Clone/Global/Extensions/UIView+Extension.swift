//
//  UIView+Extension.swift
//  29th_Assign_Youtube_Clone
//
//  Created by 황지은 on 2021/10/29.
//

import UIKit
extension UIView {
    func addSubviews(_ views: [UIView]) {
        views.forEach { self.addSubview($0) }
    }
}

