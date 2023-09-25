var a = 10

func test(number: Int){
    defer {
        print ("Before Exit")
    }
    
    defer {
        print ("test second defer block")
    }
    
    a = number
    print ("Variable a is assigned")
}

test(number: 20)

