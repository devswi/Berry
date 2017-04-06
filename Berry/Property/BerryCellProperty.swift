//
//  BerryCellProperty.swift
//  Berry
//
//  Created by shiwei on 06/04/2017.
//  Copyright © 2017 shiwei. All rights reserved.
//

import UIKit

public struct BerryCellProperty {
    
    /// Menu cell height **default 44.0**
    var cellHeight: CGFloat = 44.0
    
    /// Menu cell backgroundColor
    var cellBackgroundColor: UIColor = UIColor.white
    
    /// Menu cell separtor line background color
    var cellSeparatorColor: UIColor = UIColor(red: 219/255.0, green: 219/255.0, blue: 219/255.0, alpha: 1.0)
    
    /// Menu cell text label color
    var cellTextLabelColor: UIColor = .darkText
    
    /// Menu cell text label font
    var cellTextLabelFont: UIFont = UIFont.systemFont(ofSize: 14)
    
    /// Menu cell selected background color default is nil
    /// if nil will not set selected background color
    var cellSelectedBackgroundColor: UIColor?
    
    /// Menu cell when selected the text label color will change
    var cellSelectedTextLabelColor: UIColor = UIColor(red: 81/255.0, green: 166/255.0, blue: 1.0, alpha: 1.0)
    
    /// Text alignment default is **CENTER**
    var cellTextLabelAlignment: NSTextAlignment = .center
    
}
