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
    
    
    var responder:SelectSceneButtonNodeResponseType{
        guard let responder = scene as? SelectSceneButtonNodeResponseType else{
            fatalError("SelectSceneButtonNode may be used in no SelectSceneButtonNodeResponseTye support scene")
        }
        return responder
    }
    
    var isHighLighted = false
   
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        //fatalError("init(coder:) has not been implemented")
    }
    
        
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        super.touchesBegan(touches, withEvent: event)
        
        isHighLighted = true
    }
    
    override func touchesEnded(touches: Set<UITouch>, withEvent event: UIEvent?) {
        super.touchesEnded(touches, withEvent: event)
        
        isHighLighted = false
        
        if containTouches(touches){
            selSceneButtonTriggered()
        }
    }
    
    override func touchesCancelled(touches: Set<UITouch>?, withEvent event: UIEvent?) {
        super.touchesCancelled(touches, withEvent: event)
        
        isHighLighted = false
    }
    
    func selSceneButtonTriggered(){
        responder.selSceneButtonTriggered(self)
    }
    
    func containTouches(touches:Set<UITouch>)->Bool{
        guard let scene = scene else{
            fatalError("this touch not in a scene")
        }
        
        return touches.contains{touch in
            let touchPoint = touch.locationInNode(scene)
            let touchedNode = scene.nodeAtPoint(touchPoint)
            return touchedNode == self || touchedNode.inParentHierarchy(self)
        }
    }
    
}