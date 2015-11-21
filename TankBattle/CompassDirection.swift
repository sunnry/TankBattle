//
//  CompassDirection.swift
//  TankBattle
//
//  Created by sunny sun on 15/11/13.
//  Copyright © 2015年 sunny sun. All rights reserved.
//

import CoreGraphics

enum CompassDirection:Int{
    case East = 0
    case North
    case West
    case South
    
    static let allDirections:[CompassDirection] =
        [ .East,.North,.West,.South]
    
    var zRotation:CGFloat{
        let stepSize = CGFloat(M_PI * 2.0) / CGFloat(CompassDirection.allDirections.count)
        
        return CGFloat(self.rawValue) * stepSize
    }
    
    init(zPositon:CGFloat){
        let twoPi = M_PI * 2
        
        let rotation = (Double(zPositon) + twoPi) % twoPi
        
        let orientation = rotation / twoPi
        
        let rawFacingValue = round(orientation * Double(CompassDirection.allDirections.count)) / Double(CompassDirection.allDirections.count)
        
        self = CompassDirection(rawValue:Int(rawFacingValue))!
    }
}


