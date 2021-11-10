//
//  TypeOfViewController.swift
//  29th_Assign_Youtube_Clone
//
//  Created by 황지은 on 2021/11/11.
//

import Foundation
enum TypeOfViewController {
    case signNC
    case signIn
    case signUp
    case signConfirm
    case tabBar
    case home
    case shorts
    case add
    case subscribe
    case cabinet
}

extension TypeOfViewController {
    func storyboardRepresentation() -> StoryboardRepresentation {
        switch self {
        case .signNC:
            return StoryboardRepresentation(bundle: nil, storyboardName: identifiers.signSB, storyboardId: identifiers.signNC)
        case .signIn:
            return StoryboardRepresentation(bundle: nil, storyboardName: identifiers.signSB, storyboardId: identifiers.signInVC)
        case .signUp:
            return StoryboardRepresentation(bundle: nil, storyboardName: identifiers.signSB, storyboardId: identifiers.signUpVC)
        case .signConfirm:
            return StoryboardRepresentation(bundle: nil, storyboardName: identifiers.signSB, storyboardId: identifiers.signConfirmVC)
        case .tabBar:
            return StoryboardRepresentation(bundle: nil, storyboardName: identifiers.tabBarSB, storyboardId: identifiers.youtubeTBC)
        case .home:
            return StoryboardRepresentation(bundle: nil, storyboardName: identifiers.homeSB, storyboardId: identifiers.homeVC)
        case .shorts:
            return StoryboardRepresentation(bundle: nil, storyboardName: identifiers.shortsSB, storyboardId: identifiers.shortsVC)
        case .add:
            return StoryboardRepresentation(bundle: nil, storyboardName: identifiers.addSB, storyboardId: identifiers.addVC)
        case .subscribe:
            return StoryboardRepresentation(bundle: nil, storyboardName: identifiers.subscribeSB, storyboardId: identifiers.subscribeVC)
        case .cabinet:
            return StoryboardRepresentation(bundle: nil, storyboardName: identifiers.cabinetSB, storyboardId: identifiers.cabinetVC)
        }
    }
}
