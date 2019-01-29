//
//  BerryMaskProperty.swift
//  Berry
//
//  Created by shiwei on 06/04/2017.
//  Copyright © 2017 shiwei. All rights reserved.
//

import Foundation

public struct BerryMaskProperty {
    
    /// Background Color of mask view
    public var maskBackgroundColor: UIColor
    
    /// Opacity mask background view
    public var maskBackgroundOpacity: CGFloat
    
    static func `default`() -> BerryMaskProperty {
        
        return BerryMaskProperty(maskBackgroundColor: UIColor.black,
                                 maskBackgroundOpacity: 0.2)
    }
    
}
