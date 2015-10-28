//
//  BaseScene+Buttons.swift
//  TankBattle
//
//  Created by sunny sun on 15/10/26.
//  Copyright © 2015年 sunny sun. All rights reserved.
//

import Foundation

/// Extends `BaseScene` to respond to ButtonNode events.
extension BaseScene: ButtonNodeResponderType {
    
    /// Searches the scene for all `ButtonNode`s.
    func findAllButtonsInScene() -> [ButtonNode] {
        return ButtonIdentifier.allButtonIdentifiers.flatMap { buttonIdentifier in
            childNodeWithName("//\(buttonIdentifier.rawValue)") as? ButtonNode
        }
    }
    
    // MARK: ButtonNodeResponderType
    
    func buttonTriggered(button: ButtonNode) {
        switch button.buttonIdentifier! {
        case .Home:
            sceneManager.transitionToSceneWithSceneIdentifier(.Home)
            
        case .ProceedToNextScene:
            sceneManager.transitionToSceneWithSceneIdentifier(.NextLevel)
            
        case .Replay:
            sceneManager.transitionToSceneWithSceneIdentifier(.CurrentLevel)
            
        case .ScreenRecorderToggle:
            #if os(iOS)
               //marked by sunnry toggleScreenRecording(button)
            #endif
            
        case .ViewRecordedContent:
            #if os(iOS)
             //marked by sunnry   displayRecordedContent()
            #endif
            
        default:
            fatalError("Unsupported ButtonNode type in Scene.")
        }
    }
}
