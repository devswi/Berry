//
//  BerrySampleViewController.swift
//  Berry_Example
//
//  Created by shiwei on 2019/1/31.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

import UIKit
import Berry

class BerrySampleViewController: UIViewController {
    
    
    struct SeriseItem {
        let title: String
        let info: String
        let subSeriseID: Int
        
        var isSelected: Bool
    }

    private lazy var dropDownView: BerryDropDownView = {
        let view = BerryDropDownView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.delegate = self
        view.dataSource = self
        view.register(BerrySample1Cell.self, forSeriseIdentifier: 0, andReuseIdentifier: String(describing: BerrySample1Cell.self))
        view.register(BerrySample2Cell.self, forSeriseIdentifier: 1, andReuseIdentifier: String(describing: BerrySample2Cell.self))
        view.selectedSeriseIdentifier = [0: 1001, 1: 1001]
        return view
    }()
    
    private var serises: [AnyHashable: [SeriseItem]] = [:]
    
    private lazy var filterButton: UIButton = {
        let button = UIButton(type: .custom)
        button.frame = CGRect(origin: .zero, size: CGSize(width: 40, height: 40))
        button.setTitle("Filter", for: .normal)
        button.setTitleColor(.darkText, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        button.addTarget(self, action: #selector(filterAction(_:)), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        let rightItem = UIBarButtonItem(customView: filterButton)
        navigationItem.rightBarButtonItem = rightItem
        
        view.addSubview(dropDownView)
        view.addConstraints([
            NSLayoutConstraint(item: dropDownView, attribute: .top, relatedBy: .equal, toItem: view, attribute: .top, multiplier: 1.0, constant: 0.0),
            NSLayoutConstraint(item: dropDownView, attribute: .bottom, relatedBy: .equal, toItem: view, attribute: .bottom, multiplier: 1.0, constant: 0.0),
            NSLayoutConstraint(item: dropDownView, attribute: .leading, relatedBy: .equal, toItem: view, attribute: .leading, multiplier: 1.0, constant: 0.0),
            NSLayoutConstraint(item: dropDownView, attribute: .trailing, relatedBy: .equal, toItem: view, attribute: .trailing, multiplier: 1.0, constant: 0.0),
        ])
        
        serises = [
            0: [
                SeriseItem(title: "1-1", info: "1-1 info", subSeriseID: 1001, isSelected: true),
                SeriseItem(title: "1-2", info: "1-2 info", subSeriseID: 1002, isSelected: false),
                SeriseItem(title: "1-3", info: "1-3 info", subSeriseID: 1003, isSelected: false),
            ],
            1: [
                SeriseItem(title: "2-1", info: "2-1 info", subSeriseID: 1001, isSelected: false),
                SeriseItem(title: "2-2", info: "2-2 info", subSeriseID: 1001, isSelected: false),
                SeriseItem(title: "2-3", info: "2-3 info", subSeriseID: 1001, isSelected: false),
                SeriseItem(title: "2-4", info: "2-4 info", subSeriseID: 1001, isSelected: false),
                SeriseItem(title: "2-5", info: "2-5 info", subSeriseID: 1001, isSelected: false),
                SeriseItem(title: "2-6", info: "2-6 info", subSeriseID: 1002, isSelected: false),
                SeriseItem(title: "2-7", info: "2-7 info", subSeriseID: 1002, isSelected: false),
                SeriseItem(title: "2-8", info: "2-8 info", subSeriseID: 1002, isSelected: false),
                SeriseItem(title: "2-9", info: "2-9 info", subSeriseID: 1002, isSelected: false),
                SeriseItem(title: "2-10", info: "2-10 info", subSeriseID: 1002, isSelected: false),
                SeriseItem(title: "2-11", info: "2-11 info", subSeriseID: 1002, isSelected: false),
                SeriseItem(title: "2-12", info: "2-12 info", subSeriseID: 1002, isSelected: false),
                SeriseItem(title: "2-13", info: "2-13 info", subSeriseID: 1002, isSelected: false),
                SeriseItem(title: "2-14", info: "2-14 info", subSeriseID: 1002, isSelected: false),
                SeriseItem(title: "2-15", info: "2-15 info", subSeriseID: 1003, isSelected: false),
                SeriseItem(title: "2-16", info: "2-16 info", subSeriseID: 1003, isSelected: false),
                SeriseItem(title: "2-17", info: "2-17 info", subSeriseID: 1003, isSelected: false),
                SeriseItem(title: "2-18", info: "2-18 info", subSeriseID: 1003, isSelected: false),
                SeriseItem(title: "2-19", info: "2-19 info", subSeriseID: 1003, isSelected: false),
                SeriseItem(title: "2-20", info: "2-20 info", subSeriseID: 1003, isSelected: false),
                SeriseItem(title: "2-21", info: "2-21 info", subSeriseID: 1003, isSelected: false),
                SeriseItem(title: "2-22", info: "2-22 info", subSeriseID: 1003, isSelected: false),
                SeriseItem(title: "2-23", info: "2-23 info", subSeriseID: 1003, isSelected: false),
                SeriseItem(title: "2-24", info: "2-24 info", subSeriseID: 1003, isSelected: false),
                SeriseItem(title: "2-25", info: "2-25 info", subSeriseID: 1003, isSelected: false),
                SeriseItem(title: "2-26", info: "2-26 info", subSeriseID: 1003, isSelected: false),
            ]
        ]
        dropDownView.reloadData()
    }
    
    @objc
    func filterAction(_ sender: UIButton) {
        sender.isSelected = !sender.isSelected
        sender.isSelected ? dropDownView.display() : dropDownView.hide()
    }

}

extension BerrySampleViewController: BerryDropDownViewDelegate {
    func dropDownView(_ view: BerryDropDownView, showsVerticalScrollIndicatorFor seriesIdentifier: AnyHashable?) -> Bool {
        return false
    }
    
    func dropDownView(_ view: BerryDropDownView, backgroundColorFor seriesIdentifier: AnyHashable?) -> UIColor {
        if let seriesIdentifier = seriesIdentifier as? Int {
            switch seriesIdentifier {
            case 0: return UIColor(red: 242/255.0, green: 242/255.0, blue: 242/255.0, alpha: 1.0)
            default: return .white
            }
        }
        return .white
    }
    
    func dropDownView(_ view: BerryDropDownView, didSelectRowWith seriesIdentifier: AnyHashable?, and subSeriesIdentifier: AnyHashable?, at indexPath: IndexPath) {
        if let seriesIdentifier = seriesIdentifier as? Int, let items = serises[seriesIdentifier] {
            
            switch seriesIdentifier {
            case 0:
                serises[seriesIdentifier] = items.enumerated().map { (offset, item) -> SeriseItem in
                    var _item = item
                    _item.isSelected = offset == indexPath.row
                    return _item
                }
                view.selectedSeriseIdentifier[1] = subSeriesIdentifier
                view.reloadData()
            default:
                serises[seriesIdentifier] = items.filter { $0.subSeriseID == (subSeriesIdentifier as! Int) }.enumerated().map { (offset, item) -> SeriseItem in
                    var _item = item
                    _item.isSelected = offset == indexPath.row
                    return _item
                } + items.filter { $0.subSeriseID != (subSeriesIdentifier as! Int) }.map { item -> SeriseItem in
                    var _item = item
                    _item.isSelected = false
                    return _item
                }
                view.reloadData()
                view.hide { [weak self] _ in
                    self?.filterButton.isSelected = false
                }
            }
        }
    }
}

extension BerrySampleViewController: BerryDropDownViewDataSource {
    func dropDownView(_ view: BerryDropDownView, cellFor seriesIdentifier: AnyHashable?, and subSeriesIdentifier: AnyHashable?, at indexPath: IndexPath) -> UITableViewCell & BerryTableViewCellType {
        if let seriesIdentifier = seriesIdentifier as? Int, let items = serises[seriesIdentifier] {
            switch seriesIdentifier {
            case 0:
                guard let cell = view.dequeueReusableCell(withIdentifier: String(describing: BerrySample1Cell.self), for: indexPath, andSeriseIdentifier: seriesIdentifier) as? BerrySample1Cell else { fatalError("") }
                let item = items[indexPath.row]
                cell.item = item
                cell.subSeriesID = item.subSeriseID
                return cell
            default:
                guard let cell = view.dequeueReusableCell(withIdentifier: String(describing: BerrySample2Cell.self), for: indexPath, andSeriseIdentifier: seriesIdentifier) as? BerrySample2Cell else { fatalError("") }
                if let subSeriesIdentifier = subSeriesIdentifier as? Int {
                    let subItems = items.filter { $0.subSeriseID == subSeriesIdentifier }
                    let item = subItems[indexPath.row]
                    cell.item = item
                    cell.subSeriesID = item.subSeriseID
                }
                return cell
            }
        } else {
            fatalError("")
        }
    }
    
    func series(in dropDownView: BerryDropDownView) -> [AnyHashable] {
        return serises.keys.map { $0 as! Int }.sorted(by: { $0 < $1 }).map { $0 }
    }
    
    func dropDownView(_ view: BerryDropDownView, numberOfRowsFor seriesIdentifier: AnyHashable?, and subSeriesIdentifier: AnyHashable?) -> Int {
        if let identifier = seriesIdentifier as? Int, let serises = serises[identifier] {
            switch identifier {
            case 0: return serises.count
            default:
                if let subSeriesIdentifier = subSeriesIdentifier as? Int {
                    return serises.filter { $0.subSeriseID == subSeriesIdentifier }.count
                }
            }
        }
        return 0
    }
    
    func dropDownView(_ view: BerryDropDownView, widthRatioFor seriesIdentifier: AnyHashable?) -> CGFloat? {
        if let identifier = seriesIdentifier as? Int {
            switch identifier {
            case 0: return 0.35
            default: return 0.65
            }
        }
        return nil
    }
}
