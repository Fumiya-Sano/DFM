//
//  ReadFoodListController.swift
//  DigitalFoodManipulater
//
//  Created by 佐野文哉 on 2018/10/19.
//  Copyright © 2018年 Jenove_ze. All rights reserved.
//

import UIKit

class ReadFoodListController: UIViewController,  UITableViewDataSource,
UITableViewDelegate {


    var fontName_array:[String] = []
    var all_items:[Item] = [Item]()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        all_items.append(Item(name: "milk", date: Date()))
        all_items.append(Item(name: "tomato", date: Date(timeIntervalSinceNow: -60*60*24)))
        all_items.append(Item(name: "egg", date: Date(timeIntervalSinceNow: +60*60*24)))
        all_items.sort()
    }
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection
        section: Int) -> Int {
        return all_items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .subtitle,
                                   reuseIdentifier: "myCell")
        
        
        
        
        //cell.textLabel?.font = UIFont(name: fontname, size: 18)
        cell.textLabel?.text = all_items[indexPath.row].getName()
        
        cell.detailTextLabel?.textColor = UIColor.brown
        cell.detailTextLabel?.text = all_items[indexPath.row].getStringfromDate()
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            all_items.remove(at: indexPath.row)
            
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
}
