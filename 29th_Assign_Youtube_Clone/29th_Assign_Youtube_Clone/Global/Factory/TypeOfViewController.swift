//
//  TypeOfViewController.swift
//  29th_Assign_Youtube_Clone
//
//  Created by 황지은 on 2021/11/11.
//

import Foundation
enum TypeOfViewController {
    case sign
    case tabBar
    case home
    case shorts
    case add
    case subscribe
    case cabinet
}

extension TypeOfViewController {
    func storyboardRepresentation() -> StroyboardRepresentation {
        switch self {
        case .sign:
            return StroyboardRepresentation(bundle: nil, storyboardName: identifiers.signSB, storyboardId: identifiers.signInVC)
        case .tabBar:
            return StroyboardRepresentation(bundle: nil, storyboardName: identifiers.tabBarSB, storyboardId: identifiers.youtubeTBC)
        case .home:
            return StroyboardRepresentation(bundle: nil, storyboardName: identifiers.homeSB, storyboardId: identifiers.homeVC)
        case .shorts:
            return StroyboardRepresentation(bundle: nil, storyboardName: identifiers.shortsSB, storyboardId: identifiers.shortsVC)
        case .add:
            return StroyboardRepresentation(bundle: nil, storyboardName: identifiers.addSB, storyboardId: identifiers.addVC)
        case .subscribe:
            return StroyboardRepresentation(bundle: nil, storyboardName: identifiers.subscribeSB, storyboardId: identifiers.subscribeVC)
        case .cabinet:
            return StroyboardRepresentation(bundle: nil, storyboardName: identifiers.cabinetSB, storyboardId: identifiers.cabinetVC)
        }
    }
}
