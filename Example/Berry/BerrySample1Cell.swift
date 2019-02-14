//
//  BerrySample1Cell.swift
//  Berry_Example
//
//  Created by shiwei on 2019/2/12.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

import UIKit
import Berry

class BerrySample1Cell: UITableViewCell, BerryTableViewCellType {
    var seriesID: AnyHashable?
    
    var subSeriesID: AnyHashable?
    
    var item: BerrySampleViewController.SeriseItem? {
        didSet {
            if let item = item {
                titleLabel.textColor = item.isSelected ? .blue : .darkText
                infoLabel.textColor = item.isSelected ? .red : .gray
                contentView.backgroundColor = item.isSelected ? .white : UIColor(red: 242/255.0, green: 242/255.0, blue: 242/255.0, alpha: 1.0)
                titleLabel.text = item.title
                infoLabel.text = item.info
            }
        }
    }
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.font = UIFont.systemFont(ofSize: 16, weight: .medium)
        label.textColor = .darkText
        label.translatesAutoresizingMaskIntoConstraints = false
        label.sizeToFit()
        return label
    }()
    
    private lazy var infoLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = .gray
        label.translatesAutoresizingMaskIntoConstraints = false
        label.sizeToFit()
        return label
    }()
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.alignment = .leading
        stackView.distribution = .equalSpacing
        stackView.spacing = 5
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        selectionStyle = .none
        
        stackView.addArrangedSubview(titleLabel)
        stackView.addArrangedSubview(infoLabel)
        
        contentView.addSubview(stackView)
        
        NSLayoutConstraint.activate([
            stackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 12),
            stackView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            stackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10)
            ])
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
