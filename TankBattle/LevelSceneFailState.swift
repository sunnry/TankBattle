//
//  LevelSceneFailState.swift
//  TankBattle
//
//  Created by sunny sun on 15/11/6.
//  Copyright © 2015年 sunny sun. All rights reserved.
//

import GameplayKit

class LevelSceneFailState:LevelSceneOverlayState{
    
    init(scene:LevelScene){
        super.init(scene: scene, fileName: "FailScene")
    }
    
    override func isValidNextState(stateClass: AnyClass) -> Bool {
        return false
    }
    
    override func didEnterWithPreviousState(previousState: GKState?) {
        super.didEnterWithPreviousState(previousState)
    }
    
    override func willExitWithNextState(nextState: GKState) {
        super.willExitWithNextState(nextState)
    }
}
