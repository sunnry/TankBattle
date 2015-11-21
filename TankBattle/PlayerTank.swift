//
//  PlayerTank.swift
//  TankBattle
//
//  Created by sunny sun on 15/11/13.
//  Copyright © 2015年 sunny sun. All rights reserved.
//

import SpriteKit
import GameplayKit

class PlayerTank: GKEntity, ResourceLoadableType {
    
    static var textureSize = CGSize(width: 48.0, height: 48.0)
    
    static var appearTextures:[CompassDirection:SKTexture]?
    
    static var animations: [AnimationState:[CompassDirection:Animation]]?
    
    override init() {
        super.init()
        
        
        let renderComponent = RenderComponent(entity: self)
        addComponent(renderComponent)
        
        guard let animations = PlayerTank.animations else{
            fatalError("try to access playerTank animation before load it!")
        }
        
        let orientationComponent = OrientationComponent()
        addComponent(orientationComponent)
        
        let animationComponent = AnimationComponent(textureSize: PlayerTank.textureSize, animations:animations)
        addComponent(animationComponent)
        
        renderComponent.node.addChild(animationComponent.node)
        
        let intelligenceComponent = IntelligenceComponent(states: [PlayerTankAppearState(entity: self)])
        addComponent(intelligenceComponent)
        
    }
 
    static func loadResourcesWithCompletionHandler(completionHandler: () -> ()) {

        let playerTankAtlasNames = ["PlayerTankIdle","PlayerTankRun"]
        /*
        Preload all of the texture atlases for `FlyingBot`. This improves
        the overall loading speed of the animation cycles for this character.
        */
        SKTextureAtlas.preloadTextureAtlasesNamed(playerTankAtlasNames) { error, playerTankAtlases in
            if let error = error {
                fatalError("One or more texture atlases could not be found: \(error)")
            }
            /*
            This closure sets up all of the `FlyingBot` animations
            after the `FlyingBot` texture atlases have finished preloading.
            */
            appearTextures = [:]
            
            for orientation in CompassDirection.allDirections{
                appearTextures![orientation] = AnimationComponent.firstTextureForOrientation(orientation, inAtlas: playerTankAtlases[0], withImageIdentifier: "PlayerTankIdle")
            }
            
            animations = [:]
            animations![.Idle] = AnimationComponent.animationFromAtlas(playerTankAtlases[0], withImageIdentifier: "PlayerTankIdle", forAnimationState: .Idle)
            animations![.Run] = AnimationComponent.animationFromAtlas(playerTankAtlases[1], withImageIdentifier: "PlayerTankRun", forAnimationState: .Run)
            completionHandler()
        }
    }
  
    
    static var resourcesNeedLoading:Bool{
        return appearTextures == nil || animations == nil
    }
    
    static func purgeResources() {
        appearTextures = nil
        animations = nil
    }
}
