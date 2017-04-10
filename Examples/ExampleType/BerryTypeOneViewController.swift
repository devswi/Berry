//
//  BerryTypeOneViewController.swift
//  Examples
//
//  Created by shiwei on 07/04/2017.
//  Copyright © 2017 shiwei. All rights reserved.
//

import UIKit
import Berry

class BerryTypeOneViewController: UIViewController {

    fileprivate let items: [BerryMenuItem] = [
        BerryMenuItem("Popular", icon: "", iconHighlight: ""),
        BerryMenuItem("Recent", icon: "", iconHighlight: ""),
        BerryMenuItem("Debuts", icon: "", iconHighlight: ""),
        BerryMenuItem("Teams", icon: "", iconHighlight: ""),
        BerryMenuItem("Playoffs", icon: "", iconHighlight: "")
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
        
        let berry = BerryView(navigationController: navigationController,
                              containerView: view,
                              selectedIndex: [selectedStageIndex],
                              items: items)
        
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
