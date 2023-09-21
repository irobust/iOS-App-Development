class Inventory {
    var storedItems: [Item]
    
    init(items: [Item]){
        self.storedItems = items
    }
    
    func getItems() -> [Item]{
        return storedItems
    }
}

class Item{
    var name: String = ""
    var price: Int = 0
    
    var secret: BonusEffect?
}

struct BonusEffect {
    var bonus: Int
}

var bonus1 = BonusEffect(bonus: 15)
var item1 = Item()
item1.name = "Item 1"
item1.price = 100

// Mapping bonuseffect to item object
item1.secret = bonus1

var item2 = Item()
item2.name = "Item 2"

var inventory1 = Inventory(items: [item1, item2])
for item in inventory1.getItems() {
    if let bonus = item.secret?.bonus {
        print("\(item.name) has \(bonus)")
    } else {
        print("\(item.name) has no bonus effect")
    }
}


