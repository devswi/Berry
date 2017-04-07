//
//  BerryListViewController.swift
//  Examples
//
//  Created by shiwei on 07/04/2017.
//  Copyright © 2017 shiwei. All rights reserved.
//

import UIKit

class BerryListViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    fileprivate var list: [BerryListStruct] {
        get {
            return BerryListConfig.list
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Berry"
        
        tableView.register(UINib(nibName: BerryListTableViewCell.reuseIdentifier, bundle: nil), forCellReuseIdentifier: BerryListTableViewCell.reuseIdentifier)
    }

}

extension BerryListViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: BerryListTableViewCell.reuseIdentifier) as! BerryListTableViewCell
        
        let list = self.list[indexPath.row]
        cell.typeLabel.text = list.berryType
        cell.categoryLabel.text = list.category
        cell.describtionLabel.text = list.describtion
        
        return cell
    }
}

extension BerryListViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        var vc = UIViewController()
        
        switch indexPath.row {
        case 0: vc = BerryTypeOneViewController()
        case 1: vc = BerryTypeTwoViewController()
        case 2: vc = BerryTypeThreeViewController()
        default: break
        }
        
        navigationController?.pushViewController(vc, animated: true)
    }
}
