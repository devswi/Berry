//
//  BerryMenuProperty.swift
//  Berry
//
//  Created by shiwei on 06/04/2017.
//  Copyright © 2017 shiwei. All rights reserved.
//

import UIKit

public struct BerryMenuProperty {
    
    /// The color of menu title
    var menuTitleColor: UIColor
    
    /// The font of menu title **default** is **systemFont(ofSize: 16)**
    var menuTitleFont: UIFont
    
    /// The max number of rows showing on the menu, default is **3**
    var menuMaxShowingRows: Int
    
    /// The number of coloum on the menu, default is **1**
    var menuColoums: Int
    
    static func `default`() -> BerryMenuProperty {
        
        return BerryMenuProperty(menuTitleColor: UIColor.white,
                                 menuTitleFont: UIFont.systemFont(ofSize: 16),
                                 menuMaxShowingRows: 3,
                                 menuColoums: 1)
    }
}
