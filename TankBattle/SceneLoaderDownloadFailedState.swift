//
//  SceneLoaderDownloadFailedState.swift
//  TankBattle
//
//  Created by sunny sun on 15/10/26.
//  Copyright © 2015年 sunny sun. All rights reserved.
//

import GameplayKit

class SceneLoaderDownloadFailedState: GKState {
    // MARK: Properties
    
    unowned let sceneLoader: SceneLoader
    
    // MARK: Initialization
    
    init(sceneLoader: SceneLoader) {
        self.sceneLoader = sceneLoader
    }
    
    // MARK: GKState Life Cycle
    
    override func didEnterWithPreviousState(previousState: GKState?) {
        super.didEnterWithPreviousState(previousState)
        
        // Clear the `sceneLoader`'s progress.
        sceneLoader.progress = nil
        
        // Notify any interested objects that the download has failed.
        NSNotificationCenter.defaultCenter().postNotificationName(SceneLoaderDidFailNotification, object: sceneLoader)
    }
    
    override func isValidNextState(stateClass: AnyClass) -> Bool {
        return stateClass is SceneLoaderDownloadingResourcesState.Type
    }
}
