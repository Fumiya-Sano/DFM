//
//  ReadFoodList.swift
//  DigitalFoodManipulater
//
//  Created by 佐野文哉 on 2018/10/20.
//  Copyright © 2018年 Jenove_ze. All rights reserved.
//

import UIKit

class ReadFoodList: UITableViewController {

    var fontName_array:[String] = []
    var all_items:[Item] = [Item]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        all_items.append(Item(name: "milk", date: Date()))
        all_items.append(Item(name: "tomato", date: Date(timeIntervalSinceNow: -60*60*24)))
        all_items.append(Item(name: "egg", date: Date(timeIntervalSinceNow: +60*60*24)))
        all_items.sort()

    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {

        return all_items.count
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        return all_items.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "itemCell", for: indexPath) as? ItemTableViewCell else {
            return UITableViewCell()
        }
        
        let itemData = all_items[indexPath.row]
        
        cell.itemNameLabel.text = itemData.getName()
        cell.itemDateLabel.text = itemData.getStringfromDate()

        return cell
    }


}
