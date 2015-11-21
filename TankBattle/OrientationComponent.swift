//
//  OrientationComponent.swift
//  TankBattle
//
//  Created by sunny sun on 15/11/20.
//  Copyright © 2015年 sunny sun. All rights reserved.
//

import GameplayKit
import SpriteKit

class OrientationComponent: GKComponent {
    
    var zRotation:CGFloat = 0.0{
        didSet{
            let twoPi = CGFloat(M_PI * 2)
            zRotation = (zRotation + twoPi) % twoPi
        }
    }
    
    var compassDirection:CompassDirection{
        get {
            return CompassDirection(zPositon: zRotation)
        }
        
        set {
            zRotation = newValue.zRotation
        }
    }
    
}
