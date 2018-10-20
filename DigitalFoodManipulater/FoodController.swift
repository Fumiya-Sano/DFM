//
//  FoodController.swift
//  DigitalFoodManipulater
//
//  Created by 佐野文哉 on 2018/10/19.
//  Copyright © 2018年 Jenove_ze. All rights reserved.
//
import UIKit

class FoodController: UITableViewController {
    
    var fontName_array:[String] = []
    var aall_items:[Item] = [Item]()
    
    
    var a:Item = Item(name: "milk", date: Date())
    var b:Item = Item(name: "tomato", date: Date(timeIntervalSinceNow: -60*60*24))
    var c:Item = Item(name: "milk", date: Date(timeIntervalSinceNow: +60*60*24))
    
    var all_items = [Item(name: "milk", date: Date()), Item(name: "tomato", date: Date(timeIntervalSinceNow: -60*60*24))]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        all_items.sort()

    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return all_items.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "selectCell", for: indexPath) as? SelectTableViewCell else {
            return UITableViewCell()
        }
        
        let itemData = all_items[indexPath.row]
        
        cell.itemNameLabel.text = itemData.getName()
        cell.itemDateLabel.text = itemData.getStringfromDate()
        return cell
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            all_items.remove(at: indexPath.row)
            
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    
}
