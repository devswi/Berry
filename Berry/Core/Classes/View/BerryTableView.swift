//
//  BerryTableView.swift
//  Berry
//
//  Created by shiwei on 2019/2/7.
//

import UIKit

public protocol BerryTableViewCellType {
    var seriesID: AnyHashable? { get set }
    var subSeriesID: AnyHashable? { get set }
}

// Internal table view

///
public protocol BerryTableViewType {
    var seriesID: AnyHashable? { get set }
}

class BerryTableView: UITableView, BerryTableViewType {
    
    var seriesID: AnyHashable?

}
