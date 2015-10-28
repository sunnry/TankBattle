//
//  GameViewController.swift
//  TankBattle
//
//  Created by sunny sun on 15/10/24.
//  Copyright (c) 2015年 sunny sun. All rights reserved.
//

import UIKit
import SpriteKit

//notes: the show sequences as bellow:
//  SkNode<-SkScene<-SkView<-ViewController




class GameViewController: UIViewController {
    
    var sceneManager:SceneManager!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let skView = view as! SKView
        
        let viewSize = view.bounds.size
        let controlLength = min(GameConfiguration.TouchControl.minimumControlSize, GameConfiguration.TouchControl.idealRelativeControlSizeRate * viewSize.width)
        
        let controlSize = CGSize(width: controlLength, height: controlLength)
        
        
        let touchControlInputNode = TouchControlInputNode(frame: view.bounds, thumbStickNodeSize: controlSize)
        
        let gameInput = GameInput(nativeControlInputSource: touchControlInputNode)
        
        
        sceneManager = SceneManager(presentingView: skView, gameInput: gameInput)
        
        //sceneManager.transitionToSceneWithSceneIdentifier(.Home)
        
    }

    override func shouldAutorotate() -> Bool {
        return true
    }

    override func supportedInterfaceOrientations() -> UIInterfaceOrientationMask {
        if UIDevice.currentDevice().userInterfaceIdiom == .Phone {
            return .AllButUpsideDown
        } else {
            return .All
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Release any cached data, images, etc that aren't in use.
    }

    override func prefersStatusBarHidden() -> Bool {
        return true
    }
}
