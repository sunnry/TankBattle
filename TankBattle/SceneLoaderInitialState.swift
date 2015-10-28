//
//  SceneLoaderInitialState.swift
//  TankBattle
//
//  Created by sunny sun on 15/10/26.
//  Copyright © 2015年 sunny sun. All rights reserved.
//

import GameplayKit

class SceneLoaderInitialState: GKState {
    // MARK: Properties
    
    unowned let sceneLoader: SceneLoader
    
    // MARK: Initialization
    
    init(sceneLoader: SceneLoader) {
        self.sceneLoader = sceneLoader
    }
    
    // MARK: GKState Life Cycle
    
    override func didEnterWithPreviousState(previousState: GKState?) {
        #if os(iOS) || os(tvOS)
            // Move the `stateMachine` to the available state if no on-demand resources are required.
            if !sceneLoader.sceneMetadata.requiresOnDemandResources {
                stateMachine!.enterState(SceneLoaderResourcesAvailableState.self)
            }
        #elseif os(OSX)
            // On OS X the resources will always be in local storage available for download.
            stateMachine!.enterState(SceneLoaderResourcesAvailableState.self)
        #endif
    }
    
    override func isValidNextState(stateClass: AnyClass) -> Bool {
        #if os(iOS) || os(tvOS)
            if stateClass is SceneLoaderDownloadingResourcesState.Type {
                return true
            }
        #endif
        
        return stateClass is SceneLoaderResourcesAvailableState.Type
    }
}
