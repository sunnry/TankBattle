//
//  LevelSceneOverlayState.swift
//  TankBattle
//
//  Created by sunny sun on 15/11/7.
//  Copyright © 2015年 sunny sun. All rights reserved.
//

import GameplayKit

class LevelSceneOverlayState: GKState {
    
    unowned let levelScene:LevelScene
    
    var overlay:SceneOverlay
    
    init(scene:LevelScene,fileName:String) {
        levelScene = scene
        
        overlay = SceneOverlay(overlaySceneFileName:fileName, zPosition: WorldLayer.Top.rawValue)
        
    }
    
    override func didEnterWithPreviousState(previousState: GKState?) {
        super.didEnterWithPreviousState(previousState)
        
        levelScene.overlay = overlay
    }
    
    override func willExitWithNextState(nextState: GKState) {
        levelScene.overlay = nil
    }
}