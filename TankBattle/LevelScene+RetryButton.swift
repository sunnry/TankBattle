//
//  LevelScene+RetryButton.swift
//  TankBattle
//
//  Created by sunny sun on 15/11/10.
//  Copyright © 2015年 sunny sun. All rights reserved.
//

import Foundation


extension LevelScene:RetrySceneButtonNodeResponseType{
    func RetrySceneButtonTriggered(button: RetryButtonNode) {
        sceneManager.transitionToSceneWithSceneIdentifier(.Level(1))
    }
}