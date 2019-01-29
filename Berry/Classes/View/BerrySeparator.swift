//
//  BerrySeparator.swift
//  Berry
//
//  Created by Jerry on 06/04/2017.
//  Copyright © 2017 shiwei. All rights reserved.
//

import UIKit

public class BerrySeparator: UIView {
    
    var separatorColor: UIColor {
        get {
            return self.backgroundColor ?? UIColor.clear
        }
        set(value) {
            self.backgroundColor = value
        }
    }
    
    override public init(frame: CGRect) {
        super.init(frame: frame)
        initialize()
    }
    
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        initialize()
    }

    func initialize() {
        self.backgroundColor = UIColor.clear
    }
    
}
