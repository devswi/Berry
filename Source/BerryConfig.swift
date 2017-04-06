//
//  BerryConfig.swift
//  Berry
//
//  Created by shiwei on 06/04/2017.
//  Copyright © 2017 shiwei. All rights reserved.
//

import UIKit

public class BerryConfig {
    
    public class func config(menuProperty: BerryMenuProperty,
                             cellProperty: BerryCellProperty,
                             arrowProperty: BerryArrowProperty,
                             maskProperty: BerryMaskProperty,
                             othersProperties: BerryOtherProperty) -> BerryConfig {
    
        
        return BerryConfig()
    }
    
    init() {
        defaultConfig()
    }
    
    fileprivate func defaultConfig() {
        
    }
    
}
