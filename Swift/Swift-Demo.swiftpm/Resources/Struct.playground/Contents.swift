// Swift Variables
// 1. Value Types
//      1.1 Struct
//      1.2 Enum
//      1.3 Primitive types (Int, Bool, ...)
// 2. Reference Types
//      2.1 Class
//      2.2 Closure

class Item{
    var name: String
    var price: Double
    
    init(name: String,hasPrice price: Double){
        self.name = name
        self.price = price
    }
}

var item1 = Item(name: "Item 1",hasPrice: 1000)
var item2 = Item(name: "Item 2",hasPrice: 1500)
var defaultItem = item1

defaultItem.price = 2000
print(defaultItem.price)
print(item1.price)

struct Item2{
    var name: String
    var price: Double
    
    init(name: String, price: Double){
        self.name = name
        self.price = price
    }
    
    init(name: String){
        self.init(name: name, price: 1000)
    }
}

var item3 = Item2(name: "Struct Item", price: 3500)
var defaultItem2 = item3

defaultItem2.price = 4500
print(defaultItem2.price)
print(item3.price)

var item4 = Item2(name: "Struct Item 2")


struct Level{
    let levelID : Int
    var levelObjectives: [String]
    
    var levelDescription: String {
        return "This level ID is \(levelID)"
    }
    
    init(id: Int, objectives: [String]){
        self.levelID = id
        self.levelObjectives = objectives
    }
    
    func queryObjectives(){
        for objective in levelObjectives {
            print(objective)
        }
    }
    
    mutating func completeObjective(index: Int){
        levelObjectives.remove(at: index)
    }
}

var objectives = ["Find the lost cat", "Collect gen stones", "Defeat the big boss"]

var level1 = Level(id: 1, objectives: objectives)

var defaultLevel = level1

level1.queryObjectives()
print("-------------------")
level1.completeObjective(index: 0)
level1.queryObjectives()
print("-------------------")
defaultLevel.queryObjectives()





