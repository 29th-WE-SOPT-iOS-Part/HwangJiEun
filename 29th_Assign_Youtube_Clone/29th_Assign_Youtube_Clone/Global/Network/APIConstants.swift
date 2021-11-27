//
//  APIConstants.swift
//  29th_Assign_Youtube_Clone
//
//  Created by 황지은 on 2021/11/11.
//

import Foundation
struct APIConstants {
    //MARK: Base URL
    static let baseURL = "https://asia-northeast3-we-sopt-29.cloudfunctions.net/api"
    
    //MARK: Feature URL
    static let loginURL = baseURL + "/user/login"
    static let signUpURL = baseURL + "/user/signup"
    static let getUserURL = baseURL + "/user/"
}
  
