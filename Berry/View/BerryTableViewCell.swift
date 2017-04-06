//
//  BerryTableViewCell.swift
//  Berry
//
//  Created by Jerry on 06/04/2017.
//  Copyright © 2017 shiwei. All rights reserved.
//

import UIKit

public class BerryTableViewCell: UITableViewCell {
    
    var iconImage: UIImageView?
    var cellSepartor: BerrySeparator?
    var cellContentFrame: CGRect = .zero
    var menuConfig: BerryConfig = BerryConfig.default()

    init(style: UITableViewCellStyle,
         reuseIdentifier: String?,
         config: BerryConfig) {
        
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        menuConfig = config
        let coloums = menuConfig.menuProperty?.menuColoums ?? BerryConstant.defaultMaxColoums
        let cellHeight = menuConfig.cellProperty?.cellHeight ?? BerryConstant.defaultCellHeight
        
        cellContentFrame = CGRect(x: 0,
                                  y: 0,
                                  width: UIScreen.main.bounds.width / CGFloat(coloums),
                                  height: cellHeight)
        contentView.backgroundColor = menuConfig.cellProperty?.cellBackgroundColor
        selectionStyle = .none
        
        
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

}
