import Foundation

class Item :Comparable{
    var name: String
    var date: Date
    
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

