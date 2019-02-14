//
//  OneColumnViewController.swift
//  Berry_Example
//
//  Created by shiwei on 2019/2/14.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

import UIKit
import Berry

struct Menu: MenuPropertiesType {
    var maximumHeight: CGFloat {
        return 500
    }
}

struct DropDownConfiguration: BerryConfigurationType {
    var menu: MenuPropertiesType {
        return Menu()
    }
    
    var surface: SurfacePropertiesType {
        return BerryDefaultSurfaceProperties()
    }
    
    var animation: AnimationPropertiesType {
        return BerryDefaultAnimationProperties()
    }
}

class OneColumnViewController: UIViewController {
    
    private lazy var dropDownView: BerryDropDownView = {
        let view = BerryDropDownView(configuration: DropDownConfiguration())
        view.translatesAutoresizingMaskIntoConstraints = false
        view.delegate = self
        view.dataSource = self
        view.register(BerrySample1Cell.self, forSeriseIdentifier: 0, andReuseIdentifier: String(describing: BerrySample1Cell.self))
        view.selectedSeriseIdentifier = [0: 1001, 1: 1001]
        return view
    }()
    
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
        
        dropDownView.reloadData()
    }
    
    @objc
    func filterAction(_ sender: UIButton) {
        sender.isSelected = !sender.isSelected
        sender.isSelected ? dropDownView.display() : dropDownView.hide()
    }

}

extension OneColumnViewController: BerryDropDownViewDelegate {
    func dropDownView(_ view: BerryDropDownView, showsVerticalScrollIndicatorFor seriesIdentifier: AnyHashable?) -> Bool {
        return false
    }
    
    func dropDownView(_ view: BerryDropDownView, backgroundColorFor seriesIdentifier: AnyHashable?) -> UIColor {
        return UIColor(red: 242/255.0, green: 242/255.0, blue: 242/255.0, alpha: 1.0)
    }
}

extension OneColumnViewController: BerryDropDownViewDataSource {
    func dropDownView(_ view: BerryDropDownView, cellFor seriesIdentifier: AnyHashable?, and subSeriesIdentifier: AnyHashable?, at indexPath: IndexPath) -> UITableViewCell & BerryTableViewCellType {
        guard let cell = view.dequeueReusableCell(withIdentifier: String(describing: BerrySample1Cell.self), for: indexPath, andSeriseIdentifier: seriesIdentifier) as? BerrySample1Cell else { fatalError("") }
        cell.item = BerrySampleViewController.SeriseItem(title: "1-\(indexPath.row + 1)", info: "1-\(indexPath.row + 1) info", subSeriseID: 1001, isSelected: false)
        cell.subSeriesID = nil
        return cell
    }
    
    func series(in dropDownView: BerryDropDownView) -> [AnyHashable] {
        return [0]
    }
    
    func dropDownView(_ view: BerryDropDownView, numberOfRowsFor seriesIdentifier: AnyHashable?, and subSeriesIdentifier: AnyHashable?) -> Int {
        return 22
    }
}
