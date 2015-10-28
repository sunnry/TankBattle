//
//  ResourceLoadableType.swift
//  TankBattle
//
//  Created by sunny sun on 15/10/26.
//  Copyright © 2015年 sunny sun. All rights reserved.
//


/// A type capable of loading and managing static resources.
protocol ResourceLoadableType: class {
    /// Indicates that static resources need to be loaded.
    static var resourcesNeedLoading: Bool { get }
    
    /// Loads static resources into memory.
    static func loadResourcesWithCompletionHandler(completionHandler: () -> ())
    
    /// Releases any static resources that can be loaded again later.
    static func purgeResources()
}

