//
//  BerryView.swift
//  Berry
//
//  Created by Jerry on 06/04/2017.
//  Copyright © 2017 shiwei. All rights reserved.
//

import UIKit

public typealias SelectRowsAtIndexPathClosure = ((_ index: (coloum: Int, row: Int)) -> ())

public class BerryView: UIView {

    public var didSelectedRowsAtIndexPath: SelectRowsAtIndexPathClosure?
    
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
    fileprivate var tableViewContainerView: UIView!
    fileprivate var tableViews: Dictionary<Int, BerryTableView> = Dictionary<Int, BerryTableView>()
    
    fileprivate var berryConfig = BerryConfig.default()
    fileprivate var items: [BerryMenuItem] = []
    fileprivate var storeItems: Dictionary<Int, [BerryMenuItem]> = Dictionary<Int, [BerryMenuItem]>()
    
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
    
    ///
    /// This method can used to create Berry menu, but the coloums of this menu just can be only **1**
    ///
    /// - parameter navigationController: UINavigationController will changed when menu was selected
    /// - parameter containerView: 
    /// - parameter selectedIndex: The index of the menu which is selected
    /// - parameter items: Menu items
    /// - parameter config: BerryConfig default is **BerryConfig.default()**
    ///
    public init(navigationController: UINavigationController?,
                containerView: UIView,
                selectedIndex: [Int],
                items: [BerryMenuItem],
                config: BerryConfig = BerryConfig.default()) {
        
        guard let window = UIApplication.shared.keyWindow else {
            super.init(frame: .zero)
            return
        }
        
        guard selectedIndex.count == config.menuProperty.menuColoums else {
            fatalError("Menu coloums did not equal to data counts")
        }
        
        guard !items.isEmpty else { fatalError("Menu items is empty") }
        
        if let navigationController = navigationController {
            self.navigationController = navigationController
        } else {
            self.navigationController = window.rootViewController?.topViewController?.navigationController
        }
        
        self.berryConfig = config
        
        let title = items[selectedIndex.first ?? 0].title
        
        // Title size
        let titleSize = (title as NSString).size(attributes: [NSFontAttributeName: berryConfig.menuProperty.menuTitleFont])
        
        var arrowImage = UIImage()
        
        if let arrowImageName = berryConfig.arrowProperty.arrowImage {
            if let _arrowImage = UIImage(named: arrowImageName) {
                arrowImage = _arrowImage
            } else {
                fatalError("Arrow image was not found")
            }
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
        
        if berryConfig.menuProperty.menuColoums == 1 { // More than one coloums, tap navigation bar title view will not show menu
            menuButton.addTarget(self, action: #selector(self.menuButtonTapped(_:)), for: .touchUpInside)
        }
        
        menuTitleLabel = UILabel(frame: frame)
        menuTitleLabel.text = title
        menuTitleLabel.textColor = berryConfig.menuProperty.menuTitleColor
        menuTitleLabel.font = berryConfig.menuProperty.menuTitleFont
        menuTitleLabel.textAlignment = berryConfig.cellProperty.cellTextLabelAlignment
        
        addSubview(menuButton)
        menuButton.addSubview(menuTitleLabel)
        
        if arrowImage.size.width != 0 {
            menuArrow = UIImageView(image: arrowImage.withRenderingMode(.alwaysTemplate))
            menuArrow.tintColor = berryConfig.arrowProperty.arrowTintColor
            menuButton.addSubview(menuArrow)
        }
        
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
        
        // Setup TableView Container View
        tableViewContainerView = UIView(frame: CGRect(x: menuWrapperBounds.origin.x,
                                                      y: -realityHeight(),
                                                      width: menuWrapperBounds.width,
                                                      height: realityHeight()))
        tableViewContainerView.backgroundColor = berryConfig.cellProperty.cellBackgroundColor
        
        assembleBerryTableView(menuWrapperBounds, selectedIndex: selectedIndex)
        
        menuWrapper.addSubview(backgroundView)
        menuWrapper.addSubview(tableViewContainerView)
        containerView.addSubview(menuWrapper)
        
        menuWrapper.isHidden = true
    }
    
    // MARK: - Life Cycle
    
    override public func layoutSubviews() {
        
        menuTitleLabel.sizeToFit()
        menuTitleLabel.center = CGPoint(x: frame.size.width * 0.5,
                                        y: frame.size.height * 0.5)
        menuTitleLabel.textColor = berryConfig.menuProperty.menuTitleColor
        
        if menuArrow != nil {
            menuArrow.center = CGPoint(x: menuTitleLabel.frame.maxX + berryConfig.arrowProperty.arrowPadding,
                                       y: frame.size.height * 0.5)
        }
        
        menuWrapper.frame.origin.y = (navigationController?.navigationBar.frame.maxY)!
        tableViews.forEach { (_, tableView) in
            tableView.reloadData()
        }
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
        
        // Rotate Arrow
        if menuArrow != nil { rotateArrowAnimation() }
        
        // Wapper Animation
        backgroundView.alpha = berryConfig.maskProperty.maskBackgroundOpacity
        
        UIView.animate(withDuration: berryConfig.otherProperty.duration,
                       delay: 0,
                       usingSpringWithDamping: 0.7,
                       initialSpringVelocity: 0.5,
                       options: UIViewAnimationOptions(), animations: {
                        self.tableViewContainerView.frame.origin.y = -self.realityHeight()
                        self.backgroundView.alpha = 0
                        self.tableViews.forEach({ (_, tableView) in
                            tableView.alpha = 0
                        })
        }) { finished in
            self.menuWrapper.isHidden = finished
            self.menuButton.isUserInteractionEnabled = finished
        }
    }
    
    fileprivate func showMenu() {
        isShown = true
        menuButton.isUserInteractionEnabled = false
        
        menuWrapper.frame.origin.y = navigationController?.navigationBar.frame.maxY ?? 64.0
        
        // Rotate Arrow
        if menuArrow != nil { rotateArrowAnimation() }
        
        // Wapper Animation
        menuWrapper.isHidden = false
        backgroundView.alpha = 0
        
        menuWrapper.superview?.bringSubview(toFront: menuWrapper)
        
        UIView.animate(withDuration: berryConfig.otherProperty.duration,
                       delay: 0,
                       usingSpringWithDamping: 0.7,
                       initialSpringVelocity: 0.5,
                       options: UIViewAnimationOptions(), animations: {
                        self.tableViewContainerView.frame.origin.y = -CGFloat.spacing
                        self.backgroundView.alpha = self.berryConfig.maskProperty.maskBackgroundOpacity
                        self.tableViews.forEach({ (_, tableView) in
                            tableView.alpha = 1
                        })
        }) { finished in
            self.menuButton.isUserInteractionEnabled = finished
        }
    }
    
    fileprivate func rotateArrowAnimation() {
        UIView.animate(withDuration: berryConfig.otherProperty.duration) { [weak self] in
            guard let strongSelf = self else { return }
            strongSelf.menuArrow.transform = strongSelf.menuArrow.transform.rotated(by: 180 * CGFloat(Double.pi/180))
        }
    }
    
    fileprivate func realityHeight() -> CGFloat {
        return CGFloat(berryConfig.menuProperty.menuMaxShowingRows) * berryConfig.cellProperty.cellHeight + CGFloat.spacing
    }
    
    fileprivate func assembleBerryTableView(_ menuWrapperBounds: CGRect, selectedIndex: [Int]) {
        var items: [BerryMenuItem] = self.items
        
        (0 ..< berryConfig.menuProperty.menuColoums).forEach { index in
            let tableViewWidth: CGFloat = menuWrapperBounds.width / CGFloat(berryConfig.menuProperty.menuColoums)
            
            if self.tableViews.count == berryConfig.menuProperty.menuColoums { return }
            
            let tableView = BerryTableView(frame: CGRect(x: tableViewWidth * CGFloat(index),
                                                         y: CGFloat.spacing,
                                                         width: tableViewWidth,
                                                         height: realityHeight() - CGFloat.spacing),
                                           items: items,
                                           selectedIndex: selectedIndex[index],
                                           config: berryConfig)
            
            tableView.layer.masksToBounds = true
            tableView.backgroundColor = self.berryConfig.menuProperty.menuBackgroundColor
            tableView.selectRowAtIndexPathClosure = {
                [weak self] selectedRowIndex in
                
                guard let `self` = self else { return }
                
                if let closure = self.didSelectedRowsAtIndexPath { closure(coloum: index, row: selectedRowIndex) }
                
                // If the count of menu's coloum is one, hide menu automatically
                if self.berryConfig.menuProperty.menuColoums == 1 {
                    self.menuTitleLabel.text = items[selectedRowIndex].title
                    self.hideMenu()
                } else {
                    self.reloadTableViews(index, at: selectedRowIndex)
                }
                
                self.layoutSubviews()
            }
            tableView.alpha = 0
            self.tableViewContainerView.addSubview(tableView)
            self.tableViews[index] = tableView
            
            if self.berryConfig.menuProperty.menuColoums != 1 {
                self.storeItems[index] = items
                items = items.isEmpty ? [] : items[selectedIndex.first ?? 0].menuSubItem
            }
        }
    }
    
    fileprivate func reloadTableViews(_ from: Int, at: Int) {
        if from != (berryConfig.menuProperty.menuColoums - 1) { // The last one don't need to reload
            ((from + 1) ..< berryConfig.menuProperty.menuColoums).forEach({ (index) in
                
                var newData: [BerryMenuItem] = self.storeItems[index - 1] ?? []
                
                if newData.count > 0 { newData = newData[from == (index - 1) ? at : 0].menuSubItem }
                
                self.storeItems.updateValue(newData, forKey: index)
                
                if let tableView = self.tableViews[index] {
                    tableView.berry = newData
                    tableView.selectedIndex = 0
                    tableView.reloadData()
                }
            })
        }
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
