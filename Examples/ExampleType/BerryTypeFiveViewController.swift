//
//  BerryTypeFiveViewController.swift
//  Examples
//
//  Created by shiwei on 08/04/2017.
//  Copyright © 2017 shiwei. All rights reserved.
//

import UIKit
import Berry

class BerryTypeFiveViewController: UIViewController {

    fileprivate let items: [BerryMenuItem] = [
        BerryMenuItem("ICON & ALARM", icon: "alarm", iconHighlight: "alarm"),
        BerryMenuItem("ICON & CACHE", icon: "cache", iconHighlight: "cache"),
        BerryMenuItem("ICON & LOCK", icon: "lock", iconHighlight: "lock"),
        BerryMenuItem("ICON & SETTING", icon: "setting", iconHighlight: "setting"),
        BerryMenuItem("ICON & VERSION", icon: "version", iconHighlight: "version")
    ]
    
    fileprivate var selectedStageIndex: Int = 0
    fileprivate var lastStageIndex: Int = 0
    fileprivate var berryView: BerryView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupBerryMenu()
        view.backgroundColor = .white
    }
    
    fileprivate func setupBerryMenu() {
        
        let config = BerryConfig.default()
        
        config.cellProperty.cellTextLabelAlignment = .left
        config.arrowProperty.arrowImage = "arrow"
        config.cellProperty.cellSelectedBackgroundColor = UIColor(red: 60/255.0, green: 164/255.0, blue: 115/255.0, alpha: 1.0)
        config.cellProperty.cellSelectedTextLabelColor = UIColor.white
        
        let berry = BerryView(navigationController: navigationController,
                              containerView: view,
                              selectedIndex: [selectedStageIndex],
                              items: items,
                              config: config)
        
        berry.didSelectedRowsAtIndexPath = { [weak self] (from: Int, at: Int) in
            guard let `self` = self else { return }
            
            self.lastStageIndex = self.selectedStageIndex
            self.selectedStageIndex = at
            
            if self.lastStageIndex != self.selectedStageIndex {
                print("\(self.items[self.selectedStageIndex].title) selected")
            }
        }
        
        berryView = berry
        navigationItem.titleView = berry
    }

}
