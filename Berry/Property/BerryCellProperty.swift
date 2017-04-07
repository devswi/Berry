//
//  BerryCellProperty.swift
//  Berry
//
//  Created by shiwei on 06/04/2017.
//  Copyright © 2017 shiwei. All rights reserved.
//

import UIKit

public enum BerryCellStyle {
    case image(String)
    case nonImage
    case separator
}

public struct BerryCellProperty {
    
    /// Menu cell style default style is none of image on cell
    var cellStyle: BerryCellStyle
    
    /// Menu cell height **default 44.0**
    var cellHeight: CGFloat
    
    /// Menu cell backgroundColor
    var cellBackgroundColor: UIColor
    
    /// Menu cell separtor line background color
    var cellSeparatorColor: UIColor
    
    /// Menu cell text label color
    var cellTextLabelColor: UIColor
    
    /// Menu cell text label font
    var cellTextLabelFont: UIFont
    
    /// Menu cell selected background color default is nil
    /// if nil will not set selected background color
    var cellSelectedBackgroundColor: UIColor?
    
    /// Menu cell when selected the text label color will change
    var cellSelectedTextLabelColor: UIColor
    
    /// Text alignment default is **CENTER**
    var cellTextLabelAlignment: NSTextAlignment
    
    /// Menu cell icon
    var cellIconImage: UIImage?
    
    static func `default`() -> BerryCellProperty {
        
        return BerryCellProperty(cellStyle: .nonImage,
                                 cellHeight: BerryConstant.defaultCellHeight,
                                 cellBackgroundColor: UIColor.white,
                                 cellSeparatorColor: UIColor(red: 219/255.0, green: 219/255.0, blue: 219/255.0, alpha: 1.0),
                                 cellTextLabelColor: UIColor.darkText,
                                 cellTextLabelFont: UIFont.systemFont(ofSize: 14),
                                 cellSelectedBackgroundColor: nil,
                                 cellSelectedTextLabelColor: UIColor(red: 81/255.0, green: 166/255.0, blue: 1.0, alpha: 1.0),
                                 cellTextLabelAlignment: NSTextAlignment.center,
                                 cellIconImage: nil)
    }
}
