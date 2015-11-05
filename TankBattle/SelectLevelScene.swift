//
//  SelectLevelScene.swift
//  TankBattle
//
//  Created by sunny sun on 15/11/1.
//  Copyright © 2015年 sunny sun. All rights reserved.
//

import SpriteKit

class SelectLevelScene:BaseScene{
    
    override var backgroundNode : SKSpriteNode?{
        return childNodeWithName("backgroundNode") as? SKSpriteNode
    }
    
    //because we can not return array directly for the reason of SKScene is an objc class
    //we can only return AnyObject object to let system use objc bridge directly and down
    //cast to subclass during using
    var levelButtonNodes:[AnyObject]{
        var node:Array<AnyObject> = []

        for level in sceneManager.levelSceneArray{
            let n = backgroundNode?.childNodeWithName(level)
            if (n != nil) {
                node.append(n!)
            }
            else{
                assert(n==nil,"level select scene should not be none")
            }
        }
        return node
    }
    
    
    override func didMoveToView(view: SKView) {
        super.didMoveToView(view)
        
        for node in levelButtonNodes{
            if let n  = node as? SelectSceneButtonNode{
                n.userInteractionEnabled = true
            }
        }
        
    }
    
}


