//
//  BerryTypeFourViewController.swift
//  Examples
//
//  Created by shiwei on 08/04/2017.
//  Copyright © 2017 shiwei. All rights reserved.
//

import UIKit
import Berry

class BerryTypeFourViewController: UIViewController {

    fileprivate let items: [BerryMenuItem] = [
        BerryMenuItem("Item & Messgae", icon: "shortcut_item_message", iconHighlight: "shortcut_item_message"),
        BerryMenuItem("Item & Complaint", icon: "shortcut_item_complaint", iconHighlight: "shortcut_item_complaint"),
        BerryMenuItem("Item & Mission", icon: "shortcut_item_mission", iconHighlight: "shortcut_item_mission"),
        BerryMenuItem("Item & Statistic", icon: "shortcut_item_statistic", iconHighlight: "shortcut_item_statistic"),
        BerryMenuItem("Item & Order", icon: "shortcut_item_complaint_order", iconHighlight: "shortcut_item_complaint_order")
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
