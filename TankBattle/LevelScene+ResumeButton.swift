//
//  BaseScene+ResumeButton.swift
//  TankBattle
//
//  Created by sunny sun on 15/11/9.
//  Copyright © 2015年 sunny sun. All rights reserved.
//

import Foundation


extension LevelScene:ResumeSceneButtonNodeResponseType{
    func resumeSceneButtonTriggered(button: ResumeButtonNode) {
        stateMachine.enterState(LevelSceneActiveState)
    }
}