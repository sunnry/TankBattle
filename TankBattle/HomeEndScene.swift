//
//  HomeEndScene.swift
//  TankBattle
//
//  Created by sunny sun on 15/10/28.
//  Copyright © 2015年 sunny sun. All rights reserved.
//

import SpriteKit

class HomeEndScene: BaseScene {
    // MARK: Properties
    
    /// Returns the background node from the scene.
    override var backgroundNode: SKSpriteNode? {
        return childNodeWithName("backgroundNode") as? SKSpriteNode
    }
    
    /// The screen recorder button for the scene (if it has one).
    var screenRecorderButton: ButtonNode? {
        return backgroundNode?.childNodeWithName(ButtonIdentifier.ScreenRecorderToggle.rawValue) as? ButtonNode
    }
    
    /// The "NEW GAME" button which allows the player to proceed to the first level.
    var proceedButton: ButtonNode? {
        return backgroundNode?.childNodeWithName(ButtonIdentifier.ProceedToNextScene.rawValue) as? ButtonNode
    }
    
    /// An array of objects for `SceneLoader` notifications.
    private var sceneLoaderNotificationObservers = [AnyObject]()
    
    // MARK: Deinitialization
    
    deinit {
        // Deregister for scene loader notifications.
        for observer in sceneLoaderNotificationObservers {
            NSNotificationCenter.defaultCenter().removeObserver(observer)
        }
    }
    
    // MARK: Scene Life Cycle
    
    override func didMoveToView(view: SKView) {
        super.didMoveToView(view)
        
        #if os(iOS)
            //marked by sunnry screenRecorderButton?.isSelected = screenRecordingToggleEnabled
        #else
            screenRecorderButton?.hidden = true
        #endif
        
        // Enable focus based navigation.
        focusChangesEnabled = true
        
        registerForNotifications()
        centerCameraOnPoint(backgroundNode!.position)
        
        // Begin loading Level Select Scene as soon as the view appears.
        sceneManager.transitionToSceneWithSceneIdentifier(.SelectLevel)
        
        /*
        let levelLoader = sceneManager.sceneLoaderForSceneIdentifier(.Level(1))
        
        // If the first level is not ready, hide the buttons until we are notified.
        if !(levelLoader.stateMachine.currentState is SceneLoaderResourcesReadyState) {
            proceedButton?.alpha = 0.0
            proceedButton?.userInteractionEnabled = false
            
            screenRecorderButton?.alpha = 0.0
            screenRecorderButton?.userInteractionEnabled = false
        }
        */
    }
    
    func registerForNotifications() {
        // Only register for notifications if we haven't done so already.
        guard sceneLoaderNotificationObservers.isEmpty else { return }
        
        // Create a closure to pass as a notification handler for when loading completes or fails.
        let handleSceneLoaderNotification: (NSNotification) -> () = { [unowned self] notification in
            let sceneLoader = notification.object as! SceneLoader
            
            // Show the proceed button if the `sceneLoader` pertains to a `LevelScene`.
            if sceneLoader.sceneMetadata.sceneType is LevelScene.Type {
                // Allow the proceed and screen to be tapped or clicked.
                self.proceedButton?.userInteractionEnabled = true
                self.screenRecorderButton?.userInteractionEnabled = true
                
                // Fade in the proceed and screen recorder buttons.
                self.screenRecorderButton?.runAction(SKAction.fadeInWithDuration(1.0))
                
                // Clear the initial `proceedButton` focus.
                self.proceedButton?.isFocused = false
                self.proceedButton?.runAction(SKAction.fadeInWithDuration(1.0)) {
                    // Indicate that the `proceedButton` is focused.
                    self.resetFocus()
                }
            }
        }
        
        // Register for scene loader notifications.
        let completeNotification = NSNotificationCenter.defaultCenter().addObserverForName(SceneLoaderDidCompleteNotification, object: nil, queue: NSOperationQueue.mainQueue(), usingBlock: handleSceneLoaderNotification)
        let failNotification = NSNotificationCenter.defaultCenter().addObserverForName(SceneLoaderDidFailNotification, object: nil, queue: NSOperationQueue.mainQueue(), usingBlock: handleSceneLoaderNotification)
        
        // Keep track of the notifications we are registered to so we can remove them in `deinit`.
        sceneLoaderNotificationObservers += [completeNotification, failNotification]
    }
}

