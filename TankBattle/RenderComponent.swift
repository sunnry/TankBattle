//
//  RenderComponent.swift
//  TankBattle
//
//  Created by sunny sun on 15/11/16.
//  Copyright © 2015年 sunny sun. All rights reserved.
//

import SpriteKit
import GameplayKit


class RenderComponent: GKComponent {
    let node = EntityNode()
    
    init(entity:GKEntity){
        node.entity = entity
    }
}
