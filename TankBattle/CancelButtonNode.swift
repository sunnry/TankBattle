//
//  CancelButtonNode.swift
//  TankBattle
//
//  Created by sunny sun on 15/11/11.
//  Copyright © 2015年 sunny sun. All rights reserved.
//

import SpriteKit


protocol CancelSceneButtonNodeResponseType{
    func cancelSceneButtonTriggered(button:CancelButtonNode)
}

class CancelButtonNode: SKSpriteNode{
    var responder:CancelSceneButtonNodeResponseType{
        guard let responder = scene as? CancelSceneButtonNodeResponseType else{
            fatalError("the scene resume belong to is not RetrySceneButtonNodeResponseType")
        }
        return responder
    }
    
    override init(texture: SKTexture?, color: UIColor, size: CGSize) {
        super.init(texture: texture, color: color, size: size)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.userInteractionEnabled = true
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        super.touchesBegan(touches, withEvent: event)
    }
    
    override func touchesEnded(touches: Set<UITouch>, withEvent event: UIEvent?) {
        super.touchesEnded(touches, withEvent: event)
        
        if containTouches(touches){
            resumeButtonTriggered()
        }
    }
    
    override func touchesCancelled(touches: Set<UITouch>?, withEvent event: UIEvent?) {
        super.touchesCancelled(touches, withEvent: event)
    }
    
    func resumeButtonTriggered(){
        responder.cancelSceneButtonTriggered(self)
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