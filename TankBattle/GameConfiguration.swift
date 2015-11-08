//
//  GameConfiguration.swift
//  TankBattle
//
//  Created by sunny sun on 15/10/26.
//  Copyright © 2015年 sunny sun. All rights reserved.
//

import Foundation
import CoreGraphics



struct GameConfiguration {
    
    struct TouchControl {
        
        static let minimumRequiredThumbstickDisplacement: Float = 0.35
        
        static let minimumControlSize:CGFloat = 140
        
        static let idealRelativeControlSizeRate:CGFloat = 0.15
        
    }
    
    struct SceneManager {
        static let transitionDuration: NSTimeInterval = 2.0
    }
    
    struct TimeConfig {
        static let fontName = "DINCondensed-Bold"
        
        static let fontSizeRate:CGFloat = 0.1
        
        static let paddingSize:CGFloat = 0.2
        
        static let timeLimit:NSTimeInterval = 30
        
        static let maxDeltaUpdateTime : NSTimeInterval = 1.0/60.0
        
    }
}