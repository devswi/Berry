//
//  BerryConfig.swift
//  Berry
//
//  Created by shiwei on 06/04/2017.
//  Copyright © 2017 shiwei. All rights reserved.
//

import UIKit

public class BerryConfig {
    
    // MARK: - Menu title properties
    struct BerryMenuProperty {
        
    }
    
    // MARK: - Menu selection cell properties
    struct BerryCellProperties {
        var cellHeight: CGFloat = 44.0
        var cellBackgroundColor: UIColor?
        var cellSeparatorColor: UIColor?
        var cellTextLabelColor: UIColor?
        var cellTextLabelFont: UIFont = UIFont.systemFont(ofSize: 14)
        var cellSelectedBackgroundColor: UIColor?
        var cellSelectedTextLabelColor: UIColor?
        var cellTextLabelAlignment: NSTextAlignment = .center
    }
    
    // MARK: - Navigation bar arrow properties
    struct BerryArrowProperties {
        var arrowTineColor: UIColor?
        var arrowPadding: CGFloat = 10.0
        var arrowImage: UIImage?
    }
    
    // MARK: - Mask properties
    struct BerryMaskProperties {
        var maskBackgroundColor: UIColor?
        var maskBackgroundOpacity: CGFloat = 0.5
    }
    
    // MARK: - Other properties
    struct BerryOtherProperties {
        var duration: TimeInterval = 0.375
        var shouldChangeTitleText: Bool = true
        var shouldKeepSelectedCellColor: Bool = true
    }
    
    public class func config() -> BerryConfig {
    
        return BerryConfig()
    }
    
    init() {
        defaultConfig()
    }
    
    fileprivate func defaultConfig() {
        
    }
    
}
