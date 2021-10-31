//
//  LoginResponseDataModel.swift
//  Seminar4
//
//  Created by 황지은 on 2021/10/30.
//

import Foundation
// MARK: - LoginResponseData
struct LoginResponseData: Codable {
    let status: Int
    let success: Bool
    let message: String
    let data: LoginResultData?
}

// MARK: - DataClass
struct LoginResultData: Codable {
    let id: Int
    let name, email: String
}
