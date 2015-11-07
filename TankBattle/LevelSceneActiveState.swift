//
//  LevelSceneActiveState.swift
//  TankBattle
//
//  Created by sunny sun on 15/11/6.
//  Copyright © 2015年 sunny sun. All rights reserved.
//

import GameplayKit

class LevelSceneActiveState: GKState {
    
    unowned let levelScene:LevelScene
    
    var timeRemaining:NSTimeInterval = 0.0
    
    var timeRemainingString:String{
        let components = NSDateComponents()
        components.second = Int(max(0.0,timeRemaining))
        //setup format
        let formatter = NSDateComponentsFormatter()
        formatter.zeroFormattingBehavior = .Pad
        formatter.allowedUnits = [.Minute,.Second]
        
        return formatter.stringFromDateComponents(components)!
    }
    
    
    init(scene:LevelScene){
        levelScene = scene
        
        timeRemaining = GameConfiguration.TimeConfig.timeLimit
    }
    
    override func didEnterWithPreviousState(previousState: GKState?) {
        super.didEnterWithPreviousState(previousState)
        
        levelScene.timeNode.text = timeRemainingString
    }
    
    override func updateWithDeltaTime(seconds: NSTimeInterval) {
        super.updateWithDeltaTime(seconds)
        timeRemaining = timeRemaining - seconds
        levelScene.timeNode.text = timeRemainingString
    }
}
