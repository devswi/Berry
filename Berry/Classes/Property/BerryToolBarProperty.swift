//
//  BerryToolBarProperty.swift
//  Berry
//
//  Created by shiwei on 27/04/2017.
//  Copyright © 2017 shiwei. All rights reserved.
//

import Foundation

public struct BerryToolBarProperty {
    
    public typealias CallbackHandler = () -> Void
    
    public var cancel: String
    public var done: String
    public var doneActionHandler: CallbackHandler
    public var cancelActionHandler: CallbackHandler
    
    public init(done: String, cancel: String, doneActionHandler: @escaping CallbackHandler, cancelActionHandler: @escaping CallbackHandler) {
        self.cancel = cancel
        self.done = done
        self.doneActionHandler = doneActionHandler
        self.cancelActionHandler = cancelActionHandler
    }
    
}
