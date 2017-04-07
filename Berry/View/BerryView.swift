//
//  BerryView.swift
//  Berry
//
//  Created by Jerry on 06/04/2017.
//  Copyright © 2017 shiwei. All rights reserved.
//

import UIKit

public class BerryView: UIView {

    public var didSelectedItemAtIndex: SelectRowAtIndexPathClosure?
    public var isShown: Bool = false
    
    public var menuTitleColor: UIColor! {
        get {
            return berryConfig.menuProperty.menuTitleColor
        }
        set(value) {
            berryConfig.menuProperty.menuTitleColor = value
        }
    }
    
    public var menuArrowTintColor: UIColor! {
        get {
            return berryConfig.arrowProperty.arrowTintColor
        }
        set(value) {
            berryConfig.arrowProperty.arrowTintColor = value
            menuArrow.tintColor = berryConfig.arrowProperty.arrowTintColor
        }
    }
    
    public var cellBackgroundColor: UIColor! {
        get {
            return berryConfig.cellProperty.cellBackgroundColor
        }
        set(value) {
            berryConfig.cellProperty.cellBackgroundColor = value
        }
    }
    
    public var cellSelectedColor: UIColor! {
        get{
            return berryConfig.cellProperty.cellSelectedBackgroundColor
        }
        set(value) {
            berryConfig.cellProperty.cellSelectedBackgroundColor = value
        }
    }
    
    public var cellSeparatorColor: UIColor! {
        get {
            return berryConfig.cellProperty.cellSeparatorColor
        }
        set(value) {
            berryConfig.cellProperty.cellSeparatorColor = value
        }
    }
    
    public var cellTextColor: UIColor! {
        get {
            return berryConfig.cellProperty.cellTextLabelColor
        }
        set(value) {
            berryConfig.cellProperty.cellTextLabelColor = value
        }
    }
    
    public var cellTextSelectedColor: UIColor! {
        get {
            return berryConfig.cellProperty.cellSelectedTextLabelColor
        }
        set(value) {
            berryConfig.cellProperty.cellSelectedTextLabelColor = value
        }
    }
    
    public var cellTextAlignment: NSTextAlignment! {
        get {
            return berryConfig.cellProperty.cellTextLabelAlignment
        }
        set(value) {
            berryConfig.cellProperty.cellTextLabelAlignment = value
        }
    }
    
    fileprivate weak var navigationController: UINavigationController?
    fileprivate var menuButton: UIButton!
    fileprivate var menuTitleLabel: UILabel!
    fileprivate var menuArrow: UIImageView!
    fileprivate var menuWrapper: UIView!
    fileprivate var backgroundView: UIView!
    fileprivate var tableView: BerryTableView!
    
    fileprivate var items: [BerryMenuItem] = []
    fileprivate var berryConfig = BerryConfig.default()
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Public Methods
    
    public func show() {
        if isShown == false {
            showMenu()
        }
    }
    
    public func dismiss() {
        if isShown == true {
            hideMenu()
        }
    }
    
    public init(navigationController: UINavigationController?, containerView: UIView, selectedIndex: Int, items: [BerryMenuItem]) {
        guard let window = UIApplication.shared.keyWindow else {
            super.init(frame: .zero)
            return
        }
        
        if let navigationController = navigationController {
            self.navigationController = navigationController
        } else {
            self.navigationController = window.rootViewController?.topViewController?.navigationController
        }
        
        let title = items[selectedIndex].title
        
        // Title size
        let titleSize = (title as NSString).size(attributes: [NSFontAttributeName: berryConfig.menuProperty.menuTitleFont])
        
        guard let arrowImageName = berryConfig.arrowProperty.arrowImage, let arrowImage = UIImage(named: arrowImageName) else {
            fatalError("Arrow image was not found")
        }
        
        // Init frame
        let frame = CGRect(x: 0,
                           y: 0,
                           width: titleSize.width + berryConfig.arrowProperty.arrowPadding + arrowImage.size.width * 2,
                           height: navigationController?.navigationBar.frame.height ?? 64)
        
        super.init(frame: frame)
        
        self.isShown = false
        self.items = items
        
        // Setup Navigation Menu
        menuButton = UIButton(frame: frame)
        menuButton.addTarget(self, action: #selector(self.menuButtonTapped(_:)), for: .touchUpInside)
        
        menuTitleLabel = UILabel(frame: frame)
        menuTitleLabel.text = title
        menuTitleLabel.textColor = berryConfig.menuProperty.menuTitleColor
        menuTitleLabel.font = berryConfig.menuProperty.menuTitleFont
        menuTitleLabel.textAlignment = berryConfig.cellProperty.cellTextLabelAlignment
        
        menuArrow = UIImageView(image: arrowImage.withRenderingMode(.alwaysTemplate))
        menuArrow.tintColor = berryConfig.arrowProperty.arrowTintColor
        
        addSubview(menuButton)
        menuButton.addSubview(menuTitleLabel)
        menuButton.addSubview(menuArrow)
        
        
        let menuWrapperBounds = window.bounds
        
        // Setup DropdownMenu
        menuWrapper = UIView(frame: menuWrapperBounds)
        menuWrapper.clipsToBounds = true
        
        // Setup BackgroundView
        backgroundView = UIView(frame: menuWrapperBounds)
        backgroundView.backgroundColor = berryConfig.maskProperty.maskBackgroundColor
        
        let backgroundTapRecognizer = UITapGestureRecognizer(target: self,
                                                             action: #selector(BerryView.hideMenu))
        backgroundView.addGestureRecognizer(backgroundTapRecognizer)
        
        // Setup TableView
        tableView = BerryTableView(frame: CGRect(x: menuWrapperBounds.origin.x,
                                                 y: -300.0,
                                                 width: menuWrapperBounds.width,
                                                 height: 300.0 + berryConfig.cellProperty.cellHeight * CGFloat(items.count)),
                                   items: items,
                                   selectedIndex: selectedIndex,
                                   config: berryConfig)
        
        tableView.layer.cornerRadius = 5.0
        tableView.layer.masksToBounds = true
        tableView.selectRowAtIndexPathClosure = {
            [weak self] selectedIndex in
            guard let `self` = self else {
                return
            }
            if let closure = self.didSelectedItemAtIndex {
                closure(selectedIndex)
            }
            self.menuTitleLabel.text = self.items[selectedIndex].title
            
            self.hideMenu()
            self.layoutSubviews()
        }
        
        menuWrapper.addSubview(backgroundView)
        menuWrapper.addSubview(tableView)
        containerView.addSubview(menuWrapper)
        
        menuWrapper.isHidden = true
    }
    
    // MARK: - Life Cycle
    
    override public func layoutSubviews() {
        
        menuTitleLabel.sizeToFit()
        menuTitleLabel.center = CGPoint(x: frame.size.width * 0.5,
                                        y: frame.size.height * 0.5)
        menuTitleLabel.textColor = berryConfig.menuProperty.menuTitleColor
        
        menuArrow.center = CGPoint(x: menuTitleLabel.frame.maxX + berryConfig.arrowProperty.arrowPadding,
                                   y: frame.size.height * 0.5)
        
        menuWrapper.frame.origin.y = (navigationController?.navigationBar.frame.maxY)!
        tableView.reloadData()
    }
    
    // MARK: - Private Methods
    
    fileprivate func setupDefaultConfiguration() {
        
        menuTitleColor = navigationController?.navigationBar.titleTextAttributes?[NSForegroundColorAttributeName] as? UIColor
        cellBackgroundColor = navigationController?.navigationBar.barTintColor
        cellTextColor = menuTitleColor
        cellSeparatorColor = .clear
        
        menuArrowTintColor = menuTitleColor
    }
    
    @objc fileprivate func menuButtonTapped(_ sender: UIButton) {
        isShown == true ? hideMenu() : showMenu()
    }
    
    @objc fileprivate func hideMenu() {
        isShown = false
        menuButton.isUserInteractionEnabled = false
        
        //Rotate Arrow
        rotateArrowAnimation()
        
        //Wapper Animation
        backgroundView.alpha = berryConfig.maskProperty.maskBackgroundOpacity
        
        UIView.animate(withDuration: berryConfig.otherProperty.duration,
                       delay: 0,
                       usingSpringWithDamping: 0.7,
                       initialSpringVelocity: 0.5,
                       options: UIViewAnimationOptions(),
                       animations: {
                        self.tableView.frame.origin.y = -CGFloat(self.items.count) * self.berryConfig.cellProperty.cellHeight - 300.0
                        self.backgroundView.alpha = 0
        }) { finished in
            self.menuWrapper.isHidden = true
            self.menuButton.isUserInteractionEnabled = true
        }
    }
    
    fileprivate func showMenu() {
        isShown = true
        menuButton.isUserInteractionEnabled = false
        
        menuWrapper.frame.origin.y = navigationController?.navigationBar.frame.maxY ?? 64.0
        
        let tableHeaderView = UIView(frame: CGRect(x: 0, y: 0, width: frame.width, height: 300))
        tableHeaderView.backgroundColor = berryConfig.cellProperty.cellBackgroundColor
        tableView.tableHeaderView = tableHeaderView
        
        //Rotate Arrow
        rotateArrowAnimation()
        
        //Wapper Animation
        menuWrapper.isHidden = false
        backgroundView.alpha = 0
        
        tableView.frame.origin.y = -CGFloat(items.count) * berryConfig.cellProperty.cellHeight - 300.0
        tableView.reloadData()
        
        menuWrapper.superview?.bringSubview(toFront: menuWrapper)
        
        UIView.animate(withDuration: berryConfig.otherProperty.duration,
                       delay: 0,
                       usingSpringWithDamping: 0.7,
                       initialSpringVelocity: 0.5,
                       options: UIViewAnimationOptions(),
                       animations: {
                            self.tableView.frame.origin.y = CGFloat(-300.0)
                            self.backgroundView.alpha = self.berryConfig.maskProperty.maskBackgroundOpacity
                        }
        ) { finished in
            self.menuButton.isUserInteractionEnabled = true
        }
    }
    
    fileprivate func rotateArrowAnimation() {
        UIView.animate(withDuration: berryConfig.otherProperty.duration) { [weak self] in
            guard let strongSelf = self else {
                return
            }
            strongSelf.menuArrow.transform = strongSelf.menuArrow.transform.rotated(by: 180 * CGFloat(Double.pi/180))
        }
    }
    
    fileprivate func realityHeight() -> CGFloat {
        return CGFloat(berryConfig.menuProperty.menuMaxShowingRows) * berryConfig.cellProperty.cellHeight
    }

}

extension UIViewController {
    
    // Get top visible ViewController in top present level
    fileprivate var topViewController: UIViewController? {
        return topPresentedViewController?.topVisibleViewController
    }
    
    // Get top presented ViewController
    private var topPresentedViewController: UIViewController? {
        
        var target: UIViewController? = self
        if target?.presentedViewController != nil {
            target = target?.presentedViewController
        }
        
        return target
    }
    
    // Get top visible ViewController
    private var topVisibleViewController: UIViewController? {
        
        if let navigation = self as? UINavigationController, let visibleViewController = navigation.visibleViewController {
            return visibleViewController.topVisibleViewController
        }
        if let tab = self as? UITabBarController, let selectedViewController = tab.selectedViewController {
            return selectedViewController.topVisibleViewController
        }
        
        return self
    }
    
}
