import Foundation

protocol Taggable{
    var tag : String { get set }
    var data : Data { get }
    
    static var counter: Int { get }
    
    init(tag: String, data: Data)

    static func incrementCounter()
}

extension Taggable {
    mutating func updateData(data: Data) -> Bool {
        print("Updated data")
        return true
    }
}

protocol Encryption {
    func xor(key: UInt8) -> Self?
    
    func encrypt(plainText: String) -> String
    func decrypt(cipherText: String) -> String
}

struct TaggedData: Taggable {
    var tag: String
    var data: Data
    static var counter: Int = 0
    
    init(tag: String, data: Data) {
        self.data = data
        self.tag  = tag
    }
    
    func updateData(data: Data) -> Bool{
        print("custom updated data")
        return true
    }
    
    static func incrementCounter() {
        counter += 1
    }
}

extension TaggedData : Encryption {
    func encrypt(plainText: String) -> String {
        return "adsfasdf2342342353dfsasdfsa"
    }
    
    func decrypt(cipherText: String) -> String {
        return "plain text"
    }
    
    func xor(key: UInt8) -> TaggedData? {
        return nil
    }
}

var taggedData1 = TaggedData(tag: "test", data: Data())
taggedData1.updateData(data: Data())


protocol Increment{
    mutating func increase(by incrementor: Int)
}

extension Int : Increment {
    mutating func increase(by incrementor: Int) {
        self += incrementor
    }
}

var start: Int = 0
start.increase(by: 10)
start.increase(by: 10)
start.increase(by: 10)
start.increase(by: 10)
start.increase(by: 10)
