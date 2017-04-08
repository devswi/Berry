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
        config.menuProperty.menuMaxShowingRows = 7
        config.cellProperty.hideVerticalSeparator = false
        
        let berry = BerryView(navigationController: navigationController,
                              containerView: view,
                              selectedIndex: selectedStageIndex,
                              items: items,
                              config: config)
        
        berry.didSelectedRowsAtIndexPath = { [weak self] (coloum: Int, row: Int) in
            guard let `self` = self else { return }
            
            self.lastStageIndex[coloum] = self.selectedStageIndex[coloum]
            self.selectedStageIndex[coloum] = row
            
            if self.lastStageIndex[coloum] != self.selectedStageIndex[coloum] {
                print("Select coloum => \(coloum), row => \(row)")
            }
        }
        
        berryView = berry
    }
    
    fileprivate func assembleSubItem() -> [BerryMenuItem] {
        let nanjign = [
            BerryMenuItem("鼓楼区", icon: "", iconHighlight: "", menuSubItem: [
                    BerryMenuItem("宁海路街道", icon: "", iconHighlight: ""),
                    BerryMenuItem("华侨路街道", icon: "", iconHighlight: ""),
                    BerryMenuItem("湖南路街道", icon: "", iconHighlight: ""),
                    BerryMenuItem("中央门街道", icon: "", iconHighlight: ""),
                    BerryMenuItem("挹江门街道", icon: "", iconHighlight: ""),
                    BerryMenuItem("挹江门街道", icon: "", iconHighlight: ""),
                    BerryMenuItem("江东街道", icon: "", iconHighlight: ""),
                    BerryMenuItem("凤凰街道", icon: "", iconHighlight: ""),
                    BerryMenuItem("阅江楼街道", icon: "", iconHighlight: ""),
                    BerryMenuItem("热河南路街道", icon: "", iconHighlight: ""),
                    BerryMenuItem("幕府山街道", icon: "", iconHighlight: ""),
                    BerryMenuItem("建宁路街道", icon: "", iconHighlight: ""),
                    BerryMenuItem("宝塔桥街道", icon: "", iconHighlight: ""),
                    BerryMenuItem("小市街道", icon: "", iconHighlight: ""),
                ]),
            BerryMenuItem("玄武区", icon: "", iconHighlight: "", menuSubItem: [
                    BerryMenuItem("梅园新村街道", icon: "", iconHighlight: ""),
                    BerryMenuItem("新街口街道", icon: "", iconHighlight: ""),
                    BerryMenuItem("玄武门街道", icon: "", iconHighlight: ""),
                    BerryMenuItem("锁金村街道", icon: "", iconHighlight: ""),
                    BerryMenuItem("红山街道", icon: "", iconHighlight: ""),
                    BerryMenuItem("孝陵卫街道", icon: "", iconHighlight: ""),
                    BerryMenuItem("玄武湖街道", icon: "", iconHighlight: "")
                ]),
            BerryMenuItem("秦淮区", icon: "", iconHighlight: "", menuSubItem: [
                    BerryMenuItem("秦虹街道", icon: "", iconHighlight: ""),
                    BerryMenuItem("夫子庙街道", icon: "", iconHighlight: ""),
                    BerryMenuItem("红花街道", icon: "", iconHighlight: ""),
                    BerryMenuItem("双塘街道", icon: "", iconHighlight: ""),
                    BerryMenuItem("中华门街道", icon: "", iconHighlight: ""),
                    BerryMenuItem("五老村街道", icon: "", iconHighlight: ""),
                    BerryMenuItem("洪武路街道", icon: "", iconHighlight: ""),
                    BerryMenuItem("大光路街道", icon: "", iconHighlight: ""),
                    BerryMenuItem("瑞金路街道", icon: "", iconHighlight: ""),
                    BerryMenuItem("月牙湖街道", icon: "", iconHighlight: ""),
                    BerryMenuItem("光华路街道", icon: "", iconHighlight: ""),
                    BerryMenuItem("朝天宫街道", icon: "", iconHighlight: "")
                ]),
            BerryMenuItem("建邺区", icon: "", iconHighlight: "", menuSubItem: [
                    BerryMenuItem("莫愁湖街道", icon: "", iconHighlight: ""),
                    BerryMenuItem("南苑街道", icon: "", iconHighlight: ""),
                    BerryMenuItem("兴隆街道", icon: "", iconHighlight: ""),
                    BerryMenuItem("双闸街道", icon: "", iconHighlight: ""),
                    BerryMenuItem("沙洲街道", icon: "", iconHighlight: ""),
                    BerryMenuItem("江心洲街道", icon: "", iconHighlight: "")
                ]),
            BerryMenuItem("雨花台区", icon: "", iconHighlight: "", menuSubItem: [
                    BerryMenuItem("雨花街道", icon: "", iconHighlight: ""),
                    BerryMenuItem("赛虹桥街道", icon: "", iconHighlight: ""),
                    BerryMenuItem("西善桥街道", icon: "", iconHighlight: ""),
                    BerryMenuItem("板桥街道", icon: "", iconHighlight: ""),
                    BerryMenuItem("铁心桥街道", icon: "", iconHighlight: ""),
                    BerryMenuItem("梅山街道", icon: "", iconHighlight: ""),
                    BerryMenuItem("雨花经济开发区", icon: "", iconHighlight: ""),
                    BerryMenuItem("板桥新城", icon: "", iconHighlight: "")
                ]),
            BerryMenuItem("栖霞区", icon: "", iconHighlight: "", menuSubItem: [
                    BerryMenuItem("尧化街道", icon: "", iconHighlight: ""),
                    BerryMenuItem("马群街道", icon: "", iconHighlight: ""),
                    BerryMenuItem("迈皋桥街道", icon: "", iconHighlight: ""),
                    BerryMenuItem("燕子矶街道", icon: "", iconHighlight: ""),
                    BerryMenuItem("栖霞街道", icon: "", iconHighlight: ""),
                    BerryMenuItem("龙潭街道", icon: "", iconHighlight: ""),
                    BerryMenuItem("仙林街道", icon: "", iconHighlight: ""),
                    BerryMenuItem("八卦洲街道", icon: "", iconHighlight: ""),
                    BerryMenuItem("西岗街道", icon: "", iconHighlight: "")
                ]),
            BerryMenuItem("江宁区", icon: "", iconHighlight: "", menuSubItem: [
                    BerryMenuItem("东山街道", icon: "", iconHighlight: ""),
                    BerryMenuItem("秣陵街道", icon: "", iconHighlight: ""),
                    BerryMenuItem("汤山街道", icon: "", iconHighlight: ""),
                    BerryMenuItem("淳化街道", icon: "", iconHighlight: ""),
                    BerryMenuItem("禄口街道", icon: "", iconHighlight: ""),
                    BerryMenuItem("江宁街道", icon: "", iconHighlight: ""),
                    BerryMenuItem("谷里街道", icon: "", iconHighlight: ""),
                    BerryMenuItem("湖熟街道", icon: "", iconHighlight: ""),
                    BerryMenuItem("横溪街道", icon: "", iconHighlight: ""),
                    BerryMenuItem("麒麟街道", icon: "", iconHighlight: "")
                ]),
            BerryMenuItem("浦口区", icon: "", iconHighlight: "", menuSubItem: [
                    BerryMenuItem("泰山街道", icon: "", iconHighlight: ""),
                    BerryMenuItem("顶山街道", icon: "", iconHighlight: ""),
                    BerryMenuItem("沿江街道", icon: "", iconHighlight: ""),
                    BerryMenuItem("江浦街道", icon: "", iconHighlight: ""),
                    BerryMenuItem("桥林街道", icon: "", iconHighlight: ""),
                    BerryMenuItem("汤泉街道", icon: "", iconHighlight: ""),
                    BerryMenuItem("盘城街道", icon: "", iconHighlight: ""),
                    BerryMenuItem("星甸街道", icon: "", iconHighlight: ""),
                    BerryMenuItem("永宁街道", icon: "", iconHighlight: "")
                ]),
            BerryMenuItem("六合区", icon: "", iconHighlight: "", menuSubItem: [
                    BerryMenuItem("雄州街道", icon: "", iconHighlight: ""),
                    BerryMenuItem("龙池街道", icon: "", iconHighlight: ""),
                    BerryMenuItem("程桥街道", icon: "", iconHighlight: ""),
                    BerryMenuItem("金牛湖街道", icon: "", iconHighlight: ""),
                    BerryMenuItem("横梁街道", icon: "", iconHighlight: ""),
                    BerryMenuItem("龙袍街道", icon: "", iconHighlight: ""),
                    BerryMenuItem("马鞍街道", icon: "", iconHighlight: ""),
                    BerryMenuItem("冶山街道", icon: "", iconHighlight: ""),
                    BerryMenuItem("竹镇镇", icon: "", iconHighlight: ""),
                    BerryMenuItem("大厂街道", icon: "", iconHighlight: ""),
                    BerryMenuItem("葛塘街道", icon: "", iconHighlight: ""),
                    BerryMenuItem("长芦街道", icon: "", iconHighlight: "")
                ]),
            BerryMenuItem("溧水区", icon: "", iconHighlight: "", menuSubItem: [
                    BerryMenuItem("永阳街道", icon: "", iconHighlight: ""),
                    BerryMenuItem("白马镇", icon: "", iconHighlight: ""),
                    BerryMenuItem("东屏镇", icon: "", iconHighlight: ""),
                    BerryMenuItem("柘塘街道", icon: "", iconHighlight: ""),
                    BerryMenuItem("石湫镇", icon: "", iconHighlight: ""),
                    BerryMenuItem("洪蓝镇", icon: "", iconHighlight: ""),
                    BerryMenuItem("晶桥镇", icon: "", iconHighlight: ""),
                    BerryMenuItem("和凤镇", icon: "", iconHighlight: "")
                ]),
            BerryMenuItem("高淳区", icon: "", iconHighlight: "", menuSubItem: [
                    BerryMenuItem("淳溪街道", icon: "", iconHighlight: ""),
                    BerryMenuItem("古柏街道", icon: "", iconHighlight: ""),
                    BerryMenuItem("阳江镇", icon: "", iconHighlight: ""),
                    BerryMenuItem("砖墙镇", icon: "", iconHighlight: ""),
                    BerryMenuItem("固城镇", icon: "", iconHighlight: ""),
                    BerryMenuItem("漆桥镇", icon: "", iconHighlight: ""),
                    BerryMenuItem("东坝镇", icon: "", iconHighlight: ""),
                    BerryMenuItem("桠溪镇", icon: "", iconHighlight: "")
                ]),
        ]
        
//        let zhenjiang = [
//            
//        ]
        
        let items = [
            BerryMenuItem("南京市", icon: "", iconHighlight: "", menuSubItem: nanjign),
            BerryMenuItem("镇江市", icon: "", iconHighlight: "", menuSubItem: []),
            BerryMenuItem("常州市", icon: "", iconHighlight: "", menuSubItem: []),
            BerryMenuItem("无锡市", icon: "", iconHighlight: "", menuSubItem: []),
            BerryMenuItem("苏州市", icon: "", iconHighlight: "", menuSubItem: []),
            BerryMenuItem("南通市", icon: "", iconHighlight: "", menuSubItem: []),
            BerryMenuItem("泰州市", icon: "", iconHighlight: "", menuSubItem: []),
            BerryMenuItem("扬州市", icon: "", iconHighlight: "", menuSubItem: []),
            BerryMenuItem("盐城市", icon: "", iconHighlight: "", menuSubItem: []),
            BerryMenuItem("淮安市", icon: "", iconHighlight: "", menuSubItem: []),
            BerryMenuItem("宿迁市", icon: "", iconHighlight: "", menuSubItem: []),
            BerryMenuItem("连云港市", icon: "", iconHighlight: "", menuSubItem: []),
            BerryMenuItem("徐州市", icon: "", iconHighlight: "", menuSubItem: [])
        ]
        
        return items
    }

}
