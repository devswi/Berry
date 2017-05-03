//
//  BerryStringExtension.swift
//  Berry
//
//  Created by shiwei on 27/04/2017.
//  Copyright © 2017 shiwei. All rights reserved.
//

import Foundation

extension String {
    
    func width(withConstrainedHeight height: CGFloat, font: UIFont) -> CGFloat {
        let constraintRect = CGSize(width: .greatestFiniteMagnitude, height: height)
        
        let boundingBox = self.boundingRect(with: constraintRect, options: .usesLineFragmentOrigin, attributes: [NSFontAttributeName: font], context: nil)
        
        return boundingBox.width
        
    }
    
}
