//
//  ViewController.swift
//  Examples
//
//  Created by shiwei on 06/04/2017.
//  Copyright © 2017 shiwei. All rights reserved.
//

import UIKit
import Berry

class ViewController: UIViewController {
    
    // MARK: - Properties
    fileprivate let items: [BerryMenuItem] = [
        BerryMenuItem("From | Photography",
                      icon: "",
                      iconHighlight: ""
        ),
        BerryMenuItem("From | Artwork",
                      icon: "",
                      iconHighlight: ""
        ),
        BerryMenuItem("Others",
                      icon: "",
                      iconHighlight: ""
        ),
    ]
    
    fileprivate var selectedStageIndex: Int = 0
    fileprivate var lastStageIndex: Int = 0
    fileprivate var dropdownMenu: BerryView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupBerryMenu()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    fileprivate func setupBerryMenu() {
        
        let config = BerryConfig.default()
        
        config.arrowProperty.arrowImage = "arrow"
        config.menuProperty.menuMaxShowingRows = 3
        
        let berry = BerryView(navigationController: navigationController,
                              containerView: view,
                              selectedIndex: selectedStageIndex,
                              items: items,
                              config: config)
                
        berry.didSelectedItemAtIndex = {
            [weak self] selectedIndex in
            
            guard let strongSelf = self else {
                return
            }
            
            strongSelf.lastStageIndex = strongSelf.selectedStageIndex
            strongSelf.selectedStageIndex = selectedIndex
            
            guard strongSelf.selectedStageIndex != strongSelf.lastStageIndex else {
                return
            }
            
            // Configure Selected Action
            strongSelf.selectedAction()
        }
        
        self.dropdownMenu = berry
        navigationItem.titleView = dropdownMenu
    }

    private func selectedAction() {
        print("\(items[selectedStageIndex].title)")
    }
}

