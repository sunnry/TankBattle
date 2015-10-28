//
//  SceneLoaderResourcesAvailableState.swift
//  TankBattle
//
//  Created by sunny sun on 15/10/26.
//  Copyright © 2015年 sunny sun. All rights reserved.
//

import GameplayKit

class SceneLoaderResourcesAvailableState: GKState {
    // MARK: Properties
    
    unowned let sceneLoader: SceneLoader
    
    // MARK: Initialization
    
    init(sceneLoader: SceneLoader) {
        self.sceneLoader = sceneLoader
    }
    
    // MARK: GKState Life Cycle
    
    override func isValidNextState(stateClass: AnyClass) -> Bool {
        switch stateClass {
        case is SceneLoaderInitialState.Type, is SceneLoaderPreparingResourcesState.Type:
            return true
            
        default:
            return false
        }
    }
    
}
