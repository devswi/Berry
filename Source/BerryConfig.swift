//
//  BerryConfig.swift
//  Berry
//
//  Created by shiwei on 06/04/2017.
//  Copyright © 2017 shiwei. All rights reserved.
//

import Foundation

public class BerryConfig {
    
    public var menuProperty: BerryMenuProperty?
    public var cellProperty: BerryCellProperty?
    public var arrowProperty: BerryArrowProperty?
    public var maskProperty: BerryMaskProperty?
    public var otherProperty: BerryOtherProperty?
    
    public class func `default`() -> BerryConfig {
        let config = BerryConfig()
        config.menuProperty = BerryMenuProperty.default()
        config.cellProperty = BerryCellProperty.default()
        config.arrowProperty = BerryArrowProperty.default()
        config.maskProperty = BerryMaskProperty.default()
        config.otherProperty = BerryOtherProperty.default()
        return config
    }
    
    public class func config(menuProperty: BerryMenuProperty,
                             cellProperty: BerryCellProperty,
                             arrowProperty: BerryArrowProperty,
                             maskProperty: BerryMaskProperty,
                             otherProperties: BerryOtherProperty) -> BerryConfig {
        
        let config = BerryConfig()
        config.menuProperty = menuProperty
        config.cellProperty = cellProperty
        config.arrowProperty = arrowProperty
        config.maskProperty = maskProperty
        config.otherProperty = otherProperties
        return config
    }
    
}
