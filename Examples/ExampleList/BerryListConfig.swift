//
//  BerryListConfig.swift
//  Examples
//
//  Created by shiwei on 07/04/2017.
//  Copyright © 2017 shiwei. All rights reserved.
//

import Foundation

struct BerryListStruct {
    let berryType: String
    let category: String
    let describtion: String
}

class BerryListConfig {
    
    public class var list: [BerryListStruct] {
        return [
            BerryListStruct(berryType: "Berry Menu Type 01", category: "CENTER TYPE 01", describtion: "Default"),
            BerryListStruct(berryType: "Berry Menu Type 02", category: "CENTER TYPE 02", describtion: "Arrow"),
            BerryListStruct(berryType: "Berry Menu Type 03", category: "CHAIN REACTION 01", describtion: "Arrow")
        ]
    }
    
}
