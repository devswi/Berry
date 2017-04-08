//
//  BerryArrowProperty.swift
//  Berry
//
//  Created by shiwei on 06/04/2017.
//  Copyright © 2017 shiwei. All rights reserved.
//

import UIKit

public struct BerryArrowProperty {
    
    /// 
    public var arrowTintColor: UIColor
    
    /// Arrow padding default is 10
    public var arrowPadding: CGFloat
    
    /**
     * Arrow image which one will be showed on the navigation bar
     *
     * Default is nil
     *
     * if nil will not set arrow image
     */
    public var arrowImage: String?
    
    static func `default`() -> BerryArrowProperty {
        
        return BerryArrowProperty(arrowTintColor: UIColor.darkText,
                                  arrowPadding: 10.0,
                                  arrowImage: nil)
    }
}
