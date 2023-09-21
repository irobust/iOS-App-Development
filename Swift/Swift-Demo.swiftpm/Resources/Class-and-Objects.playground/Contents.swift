class Shape{
    var numberOfSides = 0
    var name: String
    
    init(name: String){
        self.name = name
    }
    
    static let MAX_SIDE_LENGTH = 100.0
    
    convenience init(){
        self.init(name: "triangle")
        self.numberOfSides = 3
    }
    
    func showDescription() -> String{
        return "A shape \(name) with \(numberOfSides) sides"
    }
}

class Square: Shape{
    private var _sideLength : Double {
        willSet{
            print("You need to change side length to \(newValue)")
        }
        didSet{
            print("A square has changed side length from \(oldValue)")
        }
    }
    
    internal var sideLength: Double {
        get { return _sideLength }
        set {
            if newValue <= Shape.MAX_SIDE_LENGTH {
                _sideLength = newValue
            }
        }
    }
    
    var sideLengthMeter: Double {
        get{
            return sideLength / 100.0
        }
        set{
            sideLength = newValue * 100.0
        }
    }
    
    init(){
        self._sideLength = 10.0
        super.init(name: "square")
        numberOfSides = 4
    }
    
    func area() -> Double{
        return sideLength * sideLength
    }
    
    override func showDescription() -> String {
        return "A square has side length \(sideLength) cm."
    }
}

var triangle = Shape()
print(triangle.showDescription())

var square = Square()
print(square.showDescription())
let squareArea = square.area()
let sideLengthMeter = square.sideLengthMeter
square.sideLengthMeter = 0.5
print(square.sideLength)
print("A square has side length \(sideLengthMeter) m")

var shape = Shape(name: "square")
shape.numberOfSides = 4
let message = shape.showDescription()

print(message)


// Static Variables
Shape.MAX_SIDE_LENGTH
Square.MAX_SIDE_LENGTH

square.sideLength = 101
print(square.sideLength)
