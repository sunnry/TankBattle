//
//  BaseScene+SelSceneButton.swift
//  TankBattle
//
//  Created by sunny sun on 15/11/6.
//  Copyright © 2015年 sunny sun. All rights reserved.
//

import Foundation

extension BaseScene:SelectSceneButtonNodeResponseType{
    func selSceneButtonTriggered(button: SelectSceneButtonNode) {
        if button.name == "Level1"{
            sceneManager.transitionToSceneWithSceneIdentifier(.Level(1))
        }
        else{
            fatalError("unknowed SelectSceneButtonNode")
        }
        
    }
}