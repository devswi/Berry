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
    
    /// The number of column on the menu, default is **1**
    public var menuColumns: Int
    
    /// The menu table view background color
    public var menuBackgroundColor: UIColor
    
    public var tapBackgroundHideMenu: Bool
    
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
                                 menuColumns: BerryConstant.defaultMaxColumns,
                                 menuBackgroundColor: UIColor(red: 242/255.0, green: 242/255.0, blue: 242/255.0, alpha: 1.0),
                                 tapBackgroundHideMenu: true)
    }
}
