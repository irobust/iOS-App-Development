import Foundation

protocol Taggable{
    var tag : String { get set }
    var data : Data { get }
    
    static var counter: Int { get }
    
    init(tag: String, data: Data)
    
    mutating func updateData( data: Data) -> Bool
    static func incrementCounter()
}

struct TaggedData: Taggable {
    var tag: String
    var data: Data
    static var counter: Int = 0
    
    init(tag: String, data: Data) {
        self.data = data
        self.tag  = tag
    }
   
    mutating func updateData(data: Data) -> Bool {
        self.data = data
        return true
    }
    
    static func incrementCounter() {
        counter += 1
    }
}

extension TaggedData {
    func addData() -> Bool {
        return true
    }
}

var taggedData1 = TaggedData(tag: "test", data: Data())
taggedData1.addData()

