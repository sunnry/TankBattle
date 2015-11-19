//
//  LevelScene.swift
//  TankBattle
//
//  Created by sunny sun on 15/10/28.
//  Copyright © 2015年 sunny sun. All rights reserved.
//


import SpriteKit
import GameplayKit

/// The names and z-positions of each layer in a level's world.
enum WorldLayer: CGFloat {
    // The zPosition offset to use per character (`PlayerBot` or `TaskBot`).
    static let zSpacePerCharacter: CGFloat = 100
    
    // Specifying `AboveCharacters` as 1000 gives room for 9 enemies on a level.
    case Board = -100, Debug = -75, Shadows = -50, Obstacles = -25, Characters = 0, AboveCharacters = 1000, Top = 1100
    
    // The expected name for this node in the scene file.
    var nodeName: String {
        switch self {
        case .Board: return "board"
        case .Debug: return "debug"
        case .Shadows: return "shadows"
        case .Obstacles: return "obstacles"
        case .Characters: return "characters"
        case .AboveCharacters: return "above_characters"
        case .Top: return "top"
        }
    }
    
    // The full path to this node, for use with `childNodeWithName(_:)`.
    var nodePath: String {
        return "/world/\(nodeName)"
    }
    
    static var allLayers = [Board, Debug, Shadows, Obstacles, Characters, AboveCharacters, Top]
}


class LevelScene: BaseScene{
    
    var lastUpdateTimeInterval:NSTimeInterval = 0
    
    lazy var stateMachine:GKStateMachine = GKStateMachine(states: [
            LevelSceneActiveState(scene:self),
            LevelScenePauseState(scene:self),
            LevelSceneSuccessState(scene:self),
            LevelSceneFailState(scene:self)
    ])

    let timeNode = SKLabelNode(text: "--:--")
    
    var worldLayerNodes = [WorldLayer:SKNode]()

    lazy var componentSystems:[GKComponentSystem] = {
        let animationSystem = GKComponentSystem(componentClass: AnimationComponent.self)
        
        return [animationSystem]
    }()
    
    var entities = Set<GKEntity>()
    
    let playerTank = PlayerTank()
    
    
    private func scaleTimerNode(){
        timeNode.fontSize = size.height * GameConfiguration.TimeConfig.fontSizeRate
        timeNode.position.y = size.height - timeNode.frame.height
        timeNode.position.y = timeNode.position.y - GameConfiguration.TimeConfig.paddingSize
    }
    
    override func didMoveToView(view: SKView) {
        super.didMoveToView(view)
        
        registerForPauseNotifications()
        
        loadWorldLayers()
        
        //config timeNode
        timeNode.zPosition = WorldLayer.AboveCharacters.rawValue
        timeNode.fontColor = SKColor.whiteColor()
        timeNode.fontName = GameConfiguration.TimeConfig.fontName
        
        scaleTimerNode()
        
        addChild(timeNode)
        
        stateMachine.enterState(LevelSceneActiveState)
        
        
        //addEntity(playerTank)
        //add TouchInput to LevelScene
        addTouchInputToScene()
        
    }
    
    func loadWorldLayers(){
        
        for layer in WorldLayer.allLayers{
            let foundLayer = self["world/\(layer.nodeName)"]

            precondition(!foundLayer.isEmpty,"can not found node of \(layer.nodeName)")
            
            let layerNode = foundLayer.first!
            layerNode.zPosition = layer.rawValue
            
            worldLayerNodes[layer] = layerNode
        }
        
    }
    
    override func update(currentTime: NSTimeInterval) {
        super.update(currentTime)
        
        //caculate delta time need to updated
        var deltatime = currentTime - lastUpdateTimeInterval
        
        lastUpdateTimeInterval = currentTime
        
        deltatime = deltatime > GameConfiguration.TimeConfig.maxDeltaUpdateTime ? GameConfiguration.TimeConfig.maxDeltaUpdateTime : deltatime
        
        stateMachine.updateWithDeltaTime(deltatime)
    }

    func addNode(node:SKNode,toWorldLayer worldLayer:WorldLayer){
        let worldLayerNode = worldLayerNodes[worldLayer]!
        worldLayerNode.addChild(node)
    }
    
    func addEntity(entity:GKEntity){
        entities.insert(entity)
        
        for componentSystem in self.componentSystems{
            componentSystem.addComponentWithEntity(entity)
        }
        
        if let renderNode = entity.componentForClass(RenderComponent.self)?.node{
            addNode(renderNode, toWorldLayer: .Characters)
        }
    }
   
    
}
