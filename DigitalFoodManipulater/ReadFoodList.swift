
import UIKit

class ReadFoodList: UITableViewController {


    var itemList: Array<Item> = []
    var nameList: Array<String> = ["a","b","c"] //りゅーとくんから受け取る食品名のリスト
    
    var all_items: Array<Item> = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        for name in nameList {
            let item = Item(name: name, date: Date())
            itemList.append(item)
        }
        
        
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return nameList.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "itemCell", for: indexPath) as? ItemTableViewCell else {
            return UITableViewCell()
        }
        
        //登録した賞味期限を更新しようとしていますが無理でした
        let data = UserDefaults.standard.data(forKey: "array")
        if data != nil {
            all_items = NSKeyedUnarchiver.unarchiveObject(with: data!) as! Array<Item>
        }
        
        for i in 0..<nameList.count {
            for item in all_items {
                if(nameList[i] == item.getName()) {
                    itemList[i].date = item.getDate()
                }
            }
        }
        
        let itemData = itemList[indexPath.row]
        
        cell.itemNameLabel.text = itemData.getName()
        cell.itemDateLabel.text = itemData.getStringfromDate()
        return cell
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let cell = sender as? ItemTableViewCell {
            if let register = segue.destination as? Register {
                register.name = cell.itemNameLabel.text!
                
            }
        }
    }
}
