//
//  BerryConfig.swift
//  Berry
//
//  Created by shiwei on 06/04/2017.
//  Copyright © 2017 shiwei. All rights reserved.
//

import UIKit

public class BerryConfig {
    
    public var menuProperty: BerryMenuProperty = BerryMenuProperty.default()
    public var cellProperty: BerryCellProperty = BerryCellProperty.default()
    public var arrowProperty: BerryArrowProperty = BerryArrowProperty.default()
    public var maskProperty: BerryMaskProperty = BerryMaskProperty.default()
    public var otherProperty: BerryOtherProperty = BerryOtherProperty.default()
    
    public class func `default`() -> BerryConfig {
        return BerryConfig()
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
