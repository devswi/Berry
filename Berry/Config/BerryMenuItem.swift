//
//  BerryMenuItem.swift
//  Berry
//
//  Created by shiwei on 07/04/2017.
//  Copyright © 2017 shiwei. All rights reserved.
//

import Foundation

public struct BerryMenuItem {
    
    public let title: String
    public let iconImage: UIImage?
    public let iconHighlightImage: UIImage?
    
    public init(_ title: String, icon: String, iconHighlight: String) {
        self.title = title
        guard let iconImage = UIImage(named: icon) else {
            fatalError("Normal icon image not found")
        }
        self.iconImage = iconImage
        guard let iconHighlightImage = UIImage(named: iconHighlight) else {
            fatalError("Highlight icon image not found")
        }
        self.iconHighlightImage = iconHighlightImage
    }
    
}
