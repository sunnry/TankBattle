//
//  IntelligenceComponent.swift
//  TankBattle
//
//  Created by sunny sun on 15/11/19.
//  Copyright © 2015年 sunny sun. All rights reserved.
//

import SpriteKit
import GameplayKit

class IntelligenceComponent: GKComponent {

    let stateMachine:GKStateMachine
    
    let initialStateClass:AnyClass
    
    init(states:[GKState]) {
        stateMachine = GKStateMachine(states: states)
        initialStateClass = PlayerTankAppearState.self
    }
    
    override func updateWithDeltaTime(seconds: NSTimeInterval) {
        super.updateWithDeltaTime(seconds)
        
        stateMachine.updateWithDeltaTime(seconds)
    }
    
    func enterInitialState(){
        stateMachine.enterState(initialStateClass)
    }
}
