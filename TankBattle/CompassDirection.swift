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
}
