//
//  BerryTypeSixViewController.swift
//  Examples
//
//  Created by shiwei on 08/04/2017.
//  Copyright © 2017 shiwei. All rights reserved.
//

import UIKit
import Berry

class BerryTypeSixViewController: UIViewController {

    fileprivate var items: [BerryMenuItem] = []
    fileprivate var selectedStageIndex: [Int] = [0, 0]
    fileprivate var lastStageIndex: [Int] = [0, 0]
    fileprivate var berryView: BerryView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Berry Type 04"
        
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
        config.menuProperty.menuColumns = 2
        config.menuProperty.menuMaxShowingRows = 10
        config.cellProperty.hideVerticalSeparator = true
        
        let berry = BerryView(navigationController: navigationController,
                              containerView: view,
                              selectedIndex: selectedStageIndex,
                              items: items,
                              config: config)
        
        berry.didSelectedRowsAtIndexPath = { [weak self] (column: Int, row: Int) in
            guard let `self` = self else { return }
            
            self.lastStageIndex[column] = self.selectedStageIndex[column]
            self.selectedStageIndex[column] = row
            
            if self.lastStageIndex[column] != self.selectedStageIndex[column] {
                print("Select column => \(column), row => \(row)")
            }
        }
        
        berryView = berry
    }
    
    fileprivate func assembleSubItem() -> [BerryMenuItem] {
        var items: [BerryMenuItem] = []
        
        do {
            if let file = Bundle.main.path(forResource: "address2", ofType: "json") {
                
                let data = try Data(contentsOf: URL(fileURLWithPath: file))
                let json = try JSONSerialization.jsonObject(with: data, options: [])
                
                if let object = json as? [String: Any] {
                    object.forEach({ (key, value) in
                        var sub: [BerryMenuItem] = []
                        
                        if let _value = value as? [String] {
                            _value.forEach({ town in
                                sub.append(BerryMenuItem(town, icon: "", iconHighlight: "", menuSubItem: []))
                            })
                        }
                        items.append(BerryMenuItem(key, icon: "", iconHighlight: "", menuSubItem: sub))
                    })
                } else {
                    print("JSON is invalid")
                }
            } else {
                print("No file")
            }
        } catch {
            print(error.localizedDescription)
        }
        
        return items
    }

}
