//
//  SceneLoaderResourcesReadyState.swift
//  TankBattle
//
//  Created by sunny sun on 15/10/26.
//  Copyright © 2015年 sunny sun. All rights reserved.
//

import GameplayKit

class SceneLoaderResourcesReadyState: GKState {
    // MARK: Properties
    
    unowned let sceneLoader: SceneLoader
    
    // MARK: Initialization
    
    init(sceneLoader: SceneLoader) {
        self.sceneLoader = sceneLoader
    }
    
    // MARK: GKState Life Cycle
    
    override func didEnterWithPreviousState(previousState: GKState?) {
        super.didEnterWithPreviousState(previousState)
        
        // Clear the `sceneLoader`'s progress as loading is complete.
        sceneLoader.progress = nil
        
        // Notify to any interested objects that the download has completed.
        NSNotificationCenter.defaultCenter().postNotificationName(SceneLoaderDidCompleteNotification, object: sceneLoader)
    }
    
    override func isValidNextState(stateClass: AnyClass) -> Bool {
        switch stateClass {
        case is SceneLoaderResourcesAvailableState.Type, is SceneLoaderInitialState.Type:
            return true
            
        default:
            return false
        }
    }
    
    override func willExitWithNextState(nextState: GKState) {
        super.willExitWithNextState(nextState)
        
        /*
        Presenting the scene is a one shot operation. Clear the scene when
        exiting the ready state.
        */
        sceneLoader.scene = nil
    }
}
