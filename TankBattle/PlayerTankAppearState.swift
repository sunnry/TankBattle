//
//  PlayerTankAppearState.swift
//  TankBattle
//
//  Created by sunny sun on 15/11/20.
//  Copyright © 2015年 sunny sun. All rights reserved.
//
import SpriteKit
import GameplayKit


class PlayerTankAppearState: GKState {
    unowned var entity: PlayerTank
    
    var node = SKSpriteNode()
    
    var renderComponent:RenderComponent{
        guard let renderComponent = entity.componentForClass(RenderComponent.self) else {
            fatalError("can not get renderComponent from PlayerTank")
        }
        return renderComponent
    }
    
    var orientationComponent:OrientationComponent{
        guard let orientationComponent = entity.componentForClass(OrientationComponent.self) else{
            fatalError("can not get orientationComponent from PlayerTank")
        }
        return orientationComponent
    }
    
    var animationComponent:AnimationComponent{
        guard let animationComponent = entity.componentForClass(AnimationComponent.self) else{
            fatalError("can not get animationComponent from PlayerTank")
        }
        return animationComponent
    }
    
    init(entity:PlayerTank){
        self.entity = entity
    }
    
    
    override func didEnterWithPreviousState(previousState: GKState?) {
        super.didEnterWithPreviousState(previousState)
        
        guard let appearTextures = PlayerTank.appearTextures else{
            fatalError("PlayerTankAppearState want to access textures failed")
        }
        
        let texture = appearTextures[orientationComponent.compassDirection]
        
        node.texture = texture
        node.size = PlayerTank.textureSize
        
        renderComponent.node.addChild(node)
        
        animationComponent.node.hidden = true
    }
    
    override func updateWithDeltaTime(seconds: NSTimeInterval) {
        super.updateWithDeltaTime(seconds)
    }
    
    override func isValidNextState(stateClass: AnyClass) -> Bool {
        return false
    }
    
    override func willExitWithNextState(nextState: GKState) {
        super.willExitWithNextState(nextState)
    }
}