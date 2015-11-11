//
//  RetryButtonNode.swift
//  TankBattle
//
//  Created by sunny sun on 15/11/10.
//  Copyright © 2015年 sunny sun. All rights reserved.
//

import SpriteKit

protocol RetrySceneButtonNodeResponseType{
    func RetrySceneButtonTriggered(button:RetryButtonNode)
}


class RetryButtonNode: SKSpriteNode {
    var responder:RetrySceneButtonNodeResponseType{
        guard let responder = scene as? RetrySceneButtonNodeResponseType else{
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
        responder.RetrySceneButtonTriggered(self)
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