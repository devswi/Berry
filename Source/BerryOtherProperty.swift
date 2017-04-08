//
//  BerryOtherProperty.swift
//  Berry
//
//  Created by shiwei on 06/04/2017.
//  Copyright © 2017 shiwei. All rights reserved.
//

import UIKit

public struct BerryOtherProperty {
    
    /// Animation duration **default 0.375**
    public var duration: TimeInterval
    
    /// Change title text when menu cell was selected
    public var shouldChangeTitleText: Bool
    
    /// Change the color of menu's cell while cell was selected
    public var shouldKeepSelectedCellColor: Bool
    
    static func `default`() -> BerryOtherProperty {
        
        return BerryOtherProperty(duration: 0.375,
                                  shouldChangeTitleText: true,
                                  shouldKeepSelectedCellColor: true)
    }
}
