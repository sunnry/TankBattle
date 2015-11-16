//
//  AnimationComponent.swift
//  TankBattle
//
//  Created by sunny sun on 15/11/13.
//  Copyright © 2015年 sunny sun. All rights reserved.
//

import SpriteKit
import GameplayKit

enum AnimationState:String{
    case Idle = "Idle"
    case Run = "Run"
}

struct Animation{
    let animationState:AnimationState
    
    let compassDirection:CompassDirection
    
    let textures:[SKTexture]
    
    let repeatTexturesForever:Bool
    
}

class AnimationComponent: GKComponent {
    // the node on which animations should be run
    let node:SKSpriteNode
    
    var animations:[AnimationState:[CompassDirection:Animation]]
    
    init(textureSize:CGSize,animations:[AnimationState:[CompassDirection:Animation]]){
        node = SKSpriteNode(texture: nil, size: textureSize)
        self.animations = animations
    }
    
    class func firstTextureForOrientation(compassDirection:CompassDirection,inAtlas atlas:SKTextureAtlas,withImageIdentifier identifier:String)->SKTexture{
        let textureNames = atlas.textureNames.filter{$0.hasPrefix("\(identifier)_\(compassDirection.rawValue)_")}.sort()
    
        return atlas.textureNamed(textureNames.first!)
    }
    
    class func animationFromAtlas(atlas:SKTextureAtlas,withImageIdentifier identifier:String,forAnimationState animationState:AnimationState,repeatTexturesForever:Bool=true)->[CompassDirection:Animation]{
        
        var animations = [CompassDirection:Animation]()
        
        for compassDirection in CompassDirection.allDirections{
            let textures = atlas.textureNames.filter{
                $0.hasPrefix("\(identifier)_\(compassDirection.rawValue)")
                }.sort{
                    $0 < $1
                }.map{
                    atlas.textureNamed($0)
                }
            
            
            animations[compassDirection] = Animation(
                animationState:animationState,
                compassDirection:compassDirection,
                textures:textures,
                repeatTexturesForever:repeatTexturesForever
            )
        }
        
        return animations
    }
}
