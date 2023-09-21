var name = "John"

var lastname:String
lastname = "Doe"

var firstname:String = "John"

var sql = """
SELECT * FROM investments
WHERE coin = 'bitcoin'
"""

let vat = 0.07
//vat += 0.01

let amount = 2_000_0000
amount * -1
-amount

var numberText = String(10/3)

print("Current VAT = \(vat)")

var primaryEmail:String?
var sencondaryEmail:String?

primaryEmail = "john@example.com"

// if primaryEmail != nil {
//    let email = primaryEmail!
//    print(email)
// }
//
// if sencondaryEmail != nil {
//    let email = sencondaryEmail!
//    print(email)
// }

sencondaryEmail = "john2@example.com"
if let sencondaryEmail = sencondaryEmail, let primaryEmail = primaryEmail{
    print(primaryEmail, sencondaryEmail)
}else{
    print("Not have secondary email")
}

// Collection Variables
// Array
var items = ["item1", "item2"]

items.contains("item1")

items.insert("item3", at:0)

items[0]


// Dictionary
var points = ["item1": 10, "item2": 20]
points["item1"]


// SEt
var products: Set = ["Apple", "Mango"]
var faveriteProducts: Set = ["Mango", "Durian"]

var otherProducts = products.subtracting(faveriteProducts)

products.union(faveriteProducts)

products.intersection(faveriteProducts)
