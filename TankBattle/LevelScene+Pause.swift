//
//  LevelScene+Pause.swift
//  TankBattle
//
//  Created by sunny sun on 15/11/7.
//  Copyright © 2015年 sunny sun. All rights reserved.
//

import UIKit


extension LevelScene{
    
    func registerForPauseNotifications(){
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "PauseGame", name: UIApplicationWillResignActiveNotification, object: nil)
    }
    
    func PauseGame(){
        stateMachine.enterState(LevelScenePauseState)
    }
}