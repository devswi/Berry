//
//  BerryTableViewCell.swift
//  Berry
//
//  Created by Jerry on 06/04/2017.
//  Copyright © 2017 shiwei. All rights reserved.
//

import UIKit

public class BerryTableViewCell: UITableViewCell {
    
    var iconImageView: UIImageView?
    var cellContentFrame: CGRect = .zero
    var menuConfig: BerryConfig = BerryConfig.default()
    
    var cellSepartorVertical: BerrySeparator?
    var cellSepartorHorizontal: BerrySeparator?

    init(style: UITableViewCellStyle,
         reuseIdentifier: String?,
         config: BerryConfig) {
        
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        menuConfig = config
        let coloums = menuConfig.menuProperty.menuColoums
        let cellHeight = menuConfig.cellProperty.cellHeight
        
        cellContentFrame = CGRect(x: 0,
                                  y: 0,
                                  width: UIScreen.main.bounds.width / CGFloat(coloums),
                                  height: cellHeight)
        contentView.backgroundColor = menuConfig.cellProperty.cellBackgroundColor
        selectionStyle = .none
        
        let textAlignment = menuConfig.cellProperty.cellTextLabelAlignment
        
        textLabel?.textColor = menuConfig.cellProperty.cellTextLabelColor
        textLabel?.font = menuConfig.cellProperty.cellTextLabelFont
        textLabel?.textAlignment = textAlignment
        
        var iconImageViewFrame: CGRect = .zero
        
        switch textAlignment {
        case .left:
            textLabel?.frame = CGRect(x: 42,
                                      y: 0,
                                      width: cellContentFrame.width - 42,
                                      height: cellHeight)
            iconImageViewFrame = CGRect(x: BerryConstant.defaultIconSize.width,
                                        y: (cellHeight - BerryConstant.defaultIconSize.height) / 2.0,
                                        width: BerryConstant.defaultIconSize.width,
                                        height: BerryConstant.defaultIconSize.height)
        case .center:
            textLabel?.frame = cellContentFrame
        case .right:
            textLabel?.frame = CGRect(x: BerryConstant.defaultIconSize.width,
                                      y: 0,
                                      width: cellContentFrame.width - 42,
                                      height: cellHeight)
            iconImageViewFrame = CGRect(x: cellContentFrame.width - 2 * BerryConstant.defaultIconSize.width,
                                        y: (cellHeight - BerryConstant.defaultIconSize.height) / 2.0,
                                        width: BerryConstant.defaultIconSize.width,
                                        height: BerryConstant.defaultIconSize.height)
        default: break
        }
        
        // If memu just have only one coloum, icon image will be hidden
        if let icon = menuConfig.cellProperty.cellIconImage, BerryConstant.defaultMaxColoums == coloums {
            iconImageView = UIImageView(frame: iconImageViewFrame)
            iconImageView?.image = icon
            iconImageView?.contentMode = .scaleAspectFill
            contentView.addSubview(iconImageView!)
        }
        
        // Horizontal cell
        if cellSepartorHorizontal == nil {
            cellSepartorHorizontal = BerrySeparator(frame: CGRect(x: 0,
                                                                  y: cellHeight - CGFloat.half,
                                                                  width: cellContentFrame.width,
                                                                  height: CGFloat.half))
            cellSepartorHorizontal?.separatorColor = menuConfig.cellProperty.cellSeparatorColor
            contentView.addSubview(cellSepartorHorizontal!)
        }
        
        if cellSepartorVertical == nil && BerryConstant.defaultMaxColoums != coloums {
            cellSepartorVertical = BerrySeparator(frame: CGRect(x: cellContentFrame.width - CGFloat.half,
                                                                    y: 0,
                                                                    width: CGFloat.half,
                                                                    height: cellHeight))
            cellSepartorVertical?.separatorColor = menuConfig.cellProperty.cellSeparatorColor
            contentView.addSubview(cellSepartorVertical!)
        }
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

}
