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
    var arrowTineColor: UIColor = UIColor.white
    
    /// Arrow padding default is 10
    var arrowPadding: CGFloat = 10.0
    
    /**
     * Arrow image which one will be showed on the navigation bar
     *
     * Default is nil
     *
     * if nil will not set arrow image
     */
    var arrowImage: UIImage?
}
