import Foundation

class Item : NSObject, Comparable, NSCoding{
    
    
    required init?(coder aDecoder: NSCoder) {
        name = (aDecoder.decodeObject(forKey: "name") as? String)!
        date = (aDecoder.decodeObject(forKey: "date") as? Date)!
    }
    
    var name: String
    var date: Date
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(name, forKey: "name")
        aCoder.encode(date, forKey: "date")
    }
    
    let dateFormatter = DateFormatter()
    
    
    init(name: String, date: Date){
        self.name = name
        self.date = date
    }
    
    func getName() -> String{
        return name
    }
    func  getDate() -> Date {
        return date
    }
    func getStringfromDate() -> String{
        dateFormatter.dateFormat = "yyyyMMdd"
        return dateFormatter.string(from: date)
        
    }
    
    static func ==(x: Item, y: Item) -> Bool {
        if x.getStringfromDate() == y.getStringfromDate() {
            return true
        }
        return false
    }
    
    static func <(x: Item, y: Item) -> Bool {
        
        if x.getStringfromDate() < y.getStringfromDate() {
            return true
        } else if x.getStringfromDate() > y.getStringfromDate() {
            return false
        }
        return false
    }
    
}

