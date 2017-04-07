//
//  BerryListTableViewCell.swift
//  Examples
//
//  Created by shiwei on 07/04/2017.
//  Copyright © 2017 shiwei. All rights reserved.
//

import UIKit

class BerryListTableViewCell: UITableViewCell {
    
    public class var reuseIdentifier: String {
        return "\(self)"
    }

    @IBOutlet weak var typeLabel: UILabel!
    @IBOutlet weak var categoryLabel: UILabel!
    @IBOutlet weak var describtionLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
}
