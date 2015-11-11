//
//  LevelScene+CancelButton.swift
//  TankBattle
//
//  Created by sunny sun on 15/11/11.
//  Copyright © 2015年 sunny sun. All rights reserved.
//

import Foundation


extension LevelScene:CancelSceneButtonNodeResponseType{
    func cancelSceneButtonTriggered(button: CancelButtonNode) {
        sceneManager.transitionToSceneWithSceneIdentifier(.SelectLevel)
    }
}