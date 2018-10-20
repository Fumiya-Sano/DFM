
import UIKit

class ReadFoodList: UITableViewController {
    
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
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
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

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let cell = sender as? ItemTableViewCell {
            if let register = segue.destination as? Register {
                register.name = cell.itemNameLabel.text!
            }
        }
    }
}
