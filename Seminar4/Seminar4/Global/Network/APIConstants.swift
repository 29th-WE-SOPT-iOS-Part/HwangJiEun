//
//  APIConstants.swift
//  Seminar4
//
//  Created by 황지은 on 2021/10/30.
//

import Foundation
struct APIConstants {
    //MARK: Base URL
    static let baseURL = "https://asia-northeast3-we-sopt-29.cloudfunctions.net/api"
    
    //MARK: Feature URL
    static let loginURL = baseURL + "/user/login"
    static let getUserURL = baseURL + "/user/"
}
  
