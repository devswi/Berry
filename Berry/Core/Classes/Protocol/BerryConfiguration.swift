//
//  BerryConfiguration.swift
//  Berry
//
//  Created by shiwei on 2019/1/30.
//

import UIKit

/// All Menu's Properties, for UI
///
/// If need to customize your own menu style, conform `MenuPropertiesType` protocol.
public protocol MenuPropertiesType {
    /// The background color of menu.
    var backgroundColor: UIColor { get }
    /// The maximum height of menu. Default is 352.
    var maximumHeight: CGFloat { get }
}

extension MenuPropertiesType {
    public var backgroundColor: UIColor {
        return UIColor(red: 242/255.0, green: 242/255.0, blue: 242/255.0, alpha: 1.0)
    }
    
    public var maximumHeight: CGFloat {
        return 352
    }
}

public protocol SurfacePropertiesType {
    var blurEffectStyle: UIBlurEffect.Style { get }
}

extension SurfacePropertiesType {
    public var blurEffectStyle: UIBlurEffect.Style {
        return .dark
    }
}

public protocol AnimationPropertiesType {
    /// Surface display/hide animation duration.
    var duration: TimeInterval { get }
    
    /// Menu view move up/down animation duration.
    var moveDuration: TimeInterval { get }
}

extension AnimationPropertiesType {
    public var duration: TimeInterval {
        return 0.37
    }
    
    public var moveDuration: TimeInterval {
        return 0.25
    }
}

/// Berry configuration
///
/// Include **Menu Properties**
///
public protocol BerryConfigurationType {
    var menu: MenuPropertiesType { get }
    var surface: SurfacePropertiesType { get }
    var animation: AnimationPropertiesType { get }
}
