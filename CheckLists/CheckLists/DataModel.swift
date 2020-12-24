//
//  DataModel.swift
//  CheckLists
//
//  Created by edz on 2020/12/24.
//

import Foundation

class DataModel {
    var lists = [CheckList]()
    
    init() {
      loadChecklists()
    }
    
    // MARK: - Data Saving
    func documentsDirectory() -> URL {
      let paths = FileManager.default.urls(
        for: .documentDirectory,
        in: .userDomainMask)
      return paths[0]
    }

    func dataFilePath() -> URL {
      return documentsDirectory().appendingPathComponent("CheckLists.plist")
    }

    // this method is now called saveChecklists()
    func saveCheckLists() {
      let encoder = PropertyListEncoder()
      do {
        // You encode lists instead of "items"
        let data = try encoder.encode(lists)
        try data.write(
          to: dataFilePath(),
          options: Data.WritingOptions.atomic)
      } catch {
        print("Error encoding list array: \(error.localizedDescription)")
      }
    }

    // this method is now called loadChecklists()
    func loadChecklists() {
      let path = dataFilePath()
      if let data = try? Data(contentsOf: path) {
        let decoder = PropertyListDecoder()
        do {
          // You decode to an object of [Checklist] type to lists
          lists = try decoder.decode(
            [CheckList].self,
            from: data)
        } catch {
          print("Error decoding list array: \(error.localizedDescription)")
        }
      }
    }
}
