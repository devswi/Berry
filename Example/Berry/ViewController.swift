//
//  ViewController.swift
//  Berry
//
//  Created by ShiWeiCN on 01/29/2019.
//  Copyright (c) 2019 ShiWeiCN. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.row {
        case 0:
            let viewController = BerrySampleViewController()
            navigationController?.pushViewController(viewController, animated: true)
        case 1:
            let viewController = OneColumnViewController()
            navigationController?.pushViewController(viewController, animated: true)
        default: break
        }
    }

}

