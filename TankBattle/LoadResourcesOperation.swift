//
//  LoadResourcesOperation.swift
//  TankBattle
//
//  Created by sunny sun on 15/10/27.
//  Copyright © 2015年 sunny sun. All rights reserved.
//

import Foundation

class LoadResourcesOperation: Operation, NSProgressReporting {
    // MARK: Properties
    
    /// A class that conforms to the `ResourceLoadableType` protocol.
    let loadableType: ResourceLoadableType.Type
    
    let progress: NSProgress
    
    // MARK: Initialization
    
    init(loadableType: ResourceLoadableType.Type) {
        self.loadableType = loadableType
        
        progress = NSProgress(totalUnitCount: 1)
        super.init()
    }
    
    // MARK: NSOperation
    
    override func start() {
        // If the operation is cancelled there's nothing to do.
        guard !cancelled else { return }
        
        if progress.cancelled {
            // Ensure the operation is marked as `cancelled`.
            cancel()
            return
        }
        
        // Avoid reloading the resources if they are already available.
        guard loadableType.resourcesNeedLoading else {
            finish()
            return
        }
        
        // Mark the operation as executing.
        state = .Executing
        
        // Begin loading the resources.
        loadableType.loadResourcesWithCompletionHandler { [unowned self] in
            // Mark the operation as complete once the resources are loaded.
            self.finish()
        }
    }
    
    func finish() {
        progress.completedUnitCount = 1
        state = .Finished
    }
}
