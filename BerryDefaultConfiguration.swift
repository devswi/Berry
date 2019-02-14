//
//  BerryDefaultConfiguration.swift
//  Berry
//
//  Created by shiwei on 2019/1/30.
//

import Foundation

public struct BerryDefaultMenuProperties: MenuPropertiesType {
    public init() { }
}

public struct BerryDefaultSurfaceProperties: SurfacePropertiesType {
    public init() { }
}

public struct BerryDefaultAnimationProperties: AnimationPropertiesType {
    public init() { }
}

public struct BerryDefaultConfiguration: BerryConfigurationType {
    public var menu: MenuPropertiesType {
        return BerryDefaultMenuProperties()
    }
    
    public var surface: SurfacePropertiesType {
        return BerryDefaultSurfaceProperties()
    }
    
    public var animation: AnimationPropertiesType {
        return BerryDefaultAnimationProperties()
    }
}
