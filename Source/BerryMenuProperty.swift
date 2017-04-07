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
    public var menuTitleColor: UIColor
    
    /// The font of menu title **default** is **systemFont(ofSize: 16)**
    public var menuTitleFont: UIFont
    
    /// The max number of rows showing on the menu, default is **5**
    public var menuMaxShowingRows: Int
    
    /// The number of coloum on the menu, default is **1**
    public var menuColoums: Int
    
    static func `default`() -> BerryMenuProperty {
        
        var font: UIFont
        if #available(iOS 8.2, *) {
            font = UIFont.systemFont(ofSize: 16, weight: UIFontWeightMedium)
        } else {
            font = UIFont(name: "System-Medium", size: 16)!
        }
        
        return BerryMenuProperty(menuTitleColor: UIColor.darkText,
                                 menuTitleFont: font,
                                 menuMaxShowingRows: BerryConstant.defaultMaxShowingRows,
                                 menuColoums: BerryConstant.defaultMaxColoums)
    }
}
