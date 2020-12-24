//
//  CheckList.swift
//  CheckLists
//
//  Created by edz on 2020/12/20.
//

import UIKit

class CheckList: NSObject, Codable {
    var name = ""
    var items = [CheckListItem]()
    
    init(name: String) {
        self.name = name
        super.init()
    }
}
