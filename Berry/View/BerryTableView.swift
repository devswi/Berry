//
//  BerryTableView.swift
//  Berry
//
//  Created by Jerry on 06/04/2017.
//  Copyright © 2017 shiwei. All rights reserved.
//

import UIKit

public typealias SelectRowAtIndexPathClosure = ((_ row: Int) -> ())

public class BerryTableView: UITableView {

    public var selectRowAtIndexPathClosure: SelectRowAtIndexPathClosure?
    
    fileprivate var selectedIndex: Int = 0
    fileprivate var berry: [BerryMenuItem] = []
    fileprivate var berryConfig: BerryConfig = BerryConfig.default()
    fileprivate let kBerryCellReuseIdentifier = "BerryTableViewCell"
    
    init(frame: CGRect, items: [BerryMenuItem], selectedIndex: Int, config: BerryConfig) {
        super.init(frame: frame, style: .plain)
        
        self.selectedIndex = selectedIndex
        self.berry = items
        self.berryConfig = config
        
        showsVerticalScrollIndicator = false
        showsHorizontalScrollIndicator = false
        delegate = self
        dataSource = self
        separatorStyle = .none
        backgroundColor = .clear
        autoresizingMask = .flexibleWidth
        isScrollEnabled = config.menuProperty.menuMaxShowingRows < items.count
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

}

extension BerryTableView: UITableViewDataSource {
    
    public func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return berry.count
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = BerryTableViewCell(style: .default,
                                      reuseIdentifier: kBerryCellReuseIdentifier,
                                      config: berryConfig)
        cell.textLabel?.text = berry[indexPath.row].title
        
        return cell
    }
}

extension BerryTableView: UITableViewDelegate {
    
    public func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return berryConfig.cellProperty.cellHeight
    }
    
    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        selectedIndex = indexPath.row
        if let selected = selectRowAtIndexPathClosure { selected(indexPath.row) }
        reloadData()
    }
    
    public func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        
        guard berryConfig.otherProperty.shouldKeepSelectedCellColor else { return }
        
        let tableCell = cell as! BerryTableViewCell
        let icon: UIImage? = berry[indexPath.row].iconImage
        let iconHighlight: UIImage? = berry[indexPath.row].iconHighlightImage
        
        if let icon = icon, let iconHighlight = iconHighlight {
            tableCell.iconImageView?.image = isSelectedIndex(indexPath.row) ? iconHighlight : icon
        }
        
        if let selectedBackgroundColor = berryConfig.cellProperty.cellSelectedBackgroundColor, selectedBackgroundColor != .clear {
            cell.contentView.backgroundColor = isSelectedIndex(indexPath.row) ? selectedBackgroundColor : berryConfig.cellProperty.cellBackgroundColor
        }
        
        if berryConfig.cellProperty.cellSelectedTextLabelColor != .clear {
            tableCell.textLabel?.textColor = isSelectedIndex(indexPath.row) ? berryConfig.cellProperty.cellSelectedTextLabelColor : berryConfig.cellProperty.cellTextLabelColor
        }
        
        let coloums = berryConfig.menuProperty.menuColoums
        
        if indexPath.row == (berry.count - 1) && coloums == BerryConstant.defaultMaxColoums {
            tableCell.cellSepartorHorizontal?.separatorColor = .clear
        } else {
            tableCell.cellSepartorHorizontal?.separatorColor = berryConfig.cellProperty.cellSeparatorColor
        }
        
        if coloums > BerryConstant.defaultMaxColoums { // Show vertical separator
            tableCell.cellSepartorVertical?.separatorColor = berryConfig.cellProperty.cellSeparatorColor
            tableCell.cellSepartorVertical?.isHidden = isSelectedIndex(indexPath.row)
        }
    }
    
    private func isSelectedIndex(_ row: Int) -> Bool {
        return row == selectedIndex
    }
    
}
