//
//  NetworkResult.swift
//  Seminar4
//
//  Created by 황지은 on 2021/10/30.
//

import Foundation

enum NetworkResult<T> {
    case success(T)
    case requestErr(T)
    case pathErr
    case serverErr
    case networkFail
}
