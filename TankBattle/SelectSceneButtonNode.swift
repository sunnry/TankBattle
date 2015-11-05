//
//  SelectSceneButtonNode.swift
//  TankBattle
//
//  Created by sunny sun on 15/11/1.
//  Copyright © 2015年 sunny sun. All rights reserved.
//

import SpriteKit

protocol  SelectSceneButtonNodeResponseType:class{
    func selSceneButtonTriggered(button:SelectSceneButtonNode)
}


class SelectSceneButtonNode:SKSpriteNode {
    
    override init(texture: SKTexture?, color: UIColor, size: CGSize) {
        super.init(texture: texture, color: color, size: size)
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        //fatalError("init(coder:) has not been implemented")
    }
    
        
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        super.touchesBegan(touches, withEvent: event)
        
        
    }
    
    override func touchesEnded(touches: Set<UITouch>, withEvent event: UIEvent?) {
        super.touchesEnded(touches, withEvent: event)
    }
    
    override func touchesCancelled(touches: Set<UITouch>?, withEvent event: UIEvent?) {
        super.touchesCancelled(touches, withEvent: event)
    }
    
}