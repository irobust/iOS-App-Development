func greet(_ person: String, on day: String) -> Void{
    print("Hello \(person) today is \(day)")
}

greet("John Doe", on:"Wenesday")

let scores:[Float] = [3,7,5,1,6,8,3,4]
func calStat(_ scores: [Float]) -> (avg: Float, min: Float, max: Float){
    var avg: Float
    var sum: Float = 0.0
    var min = scores[0]
    var max = scores[0]
    
    for score in scores{
        if score > max{
            max = score
        }
        
        if score < min{
            min = score
        }
        sum = sum + score
    }
    
    avg = sum / Float(scores.count)
    return (avg, min, max)
}

let (_, scoreMin, _) = calStat(scores)

let stat = calStat(scores)
stat.avg
stat.min
stat.max

// Tuple

let tuple1:(Int, Bool, String) = (1, true, "Hello")
tuple1.0

let tuple2 = (id: 1, isAdmin: true, message: "Hello")
tuple2.2
tuple2.id
tuple2.message

// Named tuple
func calculate() -> (x: Int, y: Int, z: Int){
    return (1, 2, 3)
}

//let (x, y, z) = calculate()
let location = calculate()
location.x

// original tuple
func calculate2() -> (Int, Int, Int){
    return (1, 2, 3)
}

let location2 = calculate2()
location2.0

let httpStatus = (status: 404, description: "Not found")
httpStatus.0
httpStatus.status
httpStatus.description

(1,5) == (1,5)
(1,5) == (2,5)
(1,5) < (2,3)
(5,1) < (3,2)

func returnValue() -> Int{
    var a = 10, b = 20
    
    func add() -> Int{
        return a + b
    }
    
    func increment(){
        a += 10
        b += 10
    }
    increment()
    let result = add()
    return result
}

returnValue()

func makeIncrementer() ->  (Int) -> Int {
    func increment(number: Int) -> Int{
        return number + 1
    }
    return increment
}

let incrementer = makeIncrementer()
incrementer(7)

func customMatched(_ condition: ([Int], [Int]) -> Bool) -> Bool{
    let list1 = [1,2,3,4]
    let list2 = [2,4,5,6]
    
    if condition(list1, list2){
        return true
    }else{
        return false
    }
    
}

//func checkEqual(list1: [Int], list2: [Int]) -> Bool{
//    return list1[0] == list2[0]
//}

customMatched { (list1: [Int], list2: [Int]) -> Bool in
    return list1[0] == list2[0]
}

// Javascript
// var condition = function(){
//
// }
// cutomMatched(condition)

// Closer

func testFunction(_ myFunction: (Int, Int) -> Int) {
    print(String(myFunction(10, 20)))
    print(String(myFunction(-30, -20)))
    print(String(myFunction(-10, 20)))
}

testFunction () { (a: Int, b: Int) -> Int in
     return a + b
}

//  JavaScript
//  var myCloure = function(){
//
//  }
let myCloure = { (a: Int, b: Int) -> Int in
    return a + b
}

//  JavaScript
//  function myCloure(){
//
//  }
func myCloure(a: Int, b: Int) -> Int{
    return a + b
}

let numbers:[Int] = [1, 2, 3, 4, 5 ,6]

let doubleNumbers = numbers.map({ (number: Int) -> Int in
    return number * 2
})

let trippleNumbers = numbers.map {
    number in number * 3
}

numbers
doubleNumbers
trippleNumbers

