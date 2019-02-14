//
//  BerryItemForm.swift
//  Berry
//
//  Created by shiwei on 2019/1/30.
//

import Foundation

public protocol BerryItemForm {
    /// Menu item's series identifier, it's non-null
    var seriesIdentifier: String { get }
    /// Menu item's subseries identifier, it's an optional value.
    var subseriesIdentifier: String? { get }
}
