//
//  BerryMenuProperty.swift
//  Berry
//
//  Created by shiwei on 06/04/2017.
//  Copyright © 2017 shiwei. All rights reserved.
//

import Foundation

public struct BerryMenuProperty {
    
    /// The color of menu title
    var menuTitleColor: UIColor?
    
    /// The font of menu title **default** is **systemFont(ofSize: 16)**
    var menuTitleFont: UIFont = UIFont.systemFont(ofSize: 16)
    
    /// The max number of rows showing on the menu, default is **3**
    var menuMaxShowingRows: Int = 3
    
    /// The number of coloum on the menu, default is **1**
    var menuColoums: Int = 1
}
