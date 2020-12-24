//
//  ChecklistItem.swift
//  CheckLists
//
//  Created by edz on 2020/11/22.
//

import Foundation

class CheckListItem: NSObject, Codable {
    var text = ""
    var checked = false
    init(text:String, checked:Bool) {
        self.text = text
        self.checked = checked
    }
}
