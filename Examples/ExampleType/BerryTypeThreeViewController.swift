//
//  BerryTypeThreeViewController.swift
//  Examples
//
//  Created by shiwei on 07/04/2017.
//  Copyright © 2017 shiwei. All rights reserved.
//

import UIKit
import Berry

class BerryTypeThreeViewController: UIViewController {
    
    fileprivate let shotsSubItem: [BerryMenuItem] = [
        BerryMenuItem("Popular", icon: "", iconHighlight: ""),
        BerryMenuItem("Recent", icon: "", iconHighlight: ""),
        BerryMenuItem("Debuts", icon: "", iconHighlight: ""),
    ]
    
    fileprivate let nowSubItem: [BerryMenuItem] = [
        BerryMenuItem("Past Month", icon: "", iconHighlight: ""),
        BerryMenuItem("Past Year", icon: "", iconHighlight: ""),
        BerryMenuItem("Last Day", icon: "", iconHighlight: ""),
    ]
    
    fileprivate var items: [BerryMenuItem] = []
    fileprivate var selectedStageIndex: [Int] = [0, 0, 0]
    fileprivate var lastStageIndex: [Int] = [0, 0, 0]
    fileprivate var berryView: BerryView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "Berry Type 03"
        
        items = assembleSubItem()
        
        let button = UIButton(type: .custom)
        button.setTitle("筛选", for: .normal)
        button.frame = CGRect(x: 0, y: 0, width: 44, height: 44)
        button.setTitleColor(.darkText, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 14)
        button.addTarget(self, action: #selector(BerryTypeThreeViewController.buttonAction), for: .touchUpInside)
        
        let navItem = UINavigationItem()
        navItem.rightBarButtonItem = UIBarButtonItem(customView: button)
        navigationItem.rightBarButtonItem = navItem.rightBarButtonItem
        
        setupBerryMenu()
        view.backgroundColor = .white
    }
    
    func buttonAction() {
        guard berryView != nil else { return }
        if berryView.isShown {
            berryView.dismiss()
        } else {
            berryView.show()
        }
    }
    
    fileprivate func setupBerryMenu() {
        
        let config = BerryConfig.default()
        config.menuProperty.menuColoums = 3
        config.menuProperty.menuMaxShowingRows = 3
        
        let berry = BerryView(navigationController: navigationController,
                              containerView: view,
                              selectedIndex: selectedStageIndex,
                              items: items,
                              config: config)
        
        berry.didSelectedRowsAtIndexPath = { [weak self] (from: Int, at: Int) in
            guard let `self` = self else { return }
            
            self.lastStageIndex[from] = self.selectedStageIndex[from]
            self.selectedStageIndex[from] = at
            
//            if self.lastStageIndex != self.selectedStageIndex {
//                print("\(self.items[self.selectedStageIndex].title) selected")
//            }
        }
        
        berryView = berry
    }
    
    fileprivate func assembleSubItem() -> [BerryMenuItem] {
        let _nowSubItem: [BerryMenuItem] = [
            BerryMenuItem("New Shots", icon: "", iconHighlight: ""),
            BerryMenuItem("Old Shots", icon: "", iconHighlight: ""),
        ]
        
        let subShots = [
            BerryMenuItem("Popular", icon: "", iconHighlight: "", menuSubItem: nowSubItem),
            BerryMenuItem("Recent", icon: "", iconHighlight: "", menuSubItem: _nowSubItem),
            BerryMenuItem("Debuts", icon: "", iconHighlight: "", menuSubItem: shotsSubItem),
            BerryMenuItem("Recent 1", icon: "", iconHighlight: "", menuSubItem: _nowSubItem),
            BerryMenuItem("Debuts 2", icon: "", iconHighlight: "", menuSubItem: shotsSubItem),
            BerryMenuItem("Popular 1", icon: "", iconHighlight: "", menuSubItem: _nowSubItem),
            BerryMenuItem("Amazing", icon: "", iconHighlight: "", menuSubItem: shotsSubItem),
        ]
        
        let _subShots = [
            BerryMenuItem("Popular 2", icon: "", iconHighlight: "", menuSubItem: shotsSubItem),
            BerryMenuItem("Recent 2", icon: "", iconHighlight: "", menuSubItem: _nowSubItem),
            BerryMenuItem("Debuts 2", icon: "", iconHighlight: "", menuSubItem: nowSubItem)
        ]
        
        let items = [
            BerryMenuItem("Shots", icon: "", iconHighlight: "", menuSubItem: subShots),
            BerryMenuItem("Designers", icon: "", iconHighlight: "", menuSubItem: _subShots)
        ]
        
        return items
    }

}
