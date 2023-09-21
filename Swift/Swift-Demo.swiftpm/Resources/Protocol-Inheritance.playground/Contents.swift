import Foundation

protocol Taggable {
    var tag: String { get set }
    var data: [String] { get set }
    
    init(_ tag: String)
}

protocol TaggedPersistable: Taggable {
    mutating func persist(tag: String)
}

extension TaggedPersistable {
    mutating func persist(tag: String) {
        self.data.append(tag)
    }
}

protocol TaggedEncodable: Taggable {
    var base64: String { get }
}

extension TaggedEncodable {
    var base64: String {
        if let data = self.tag.data(using: .utf8) {
           let base64String = data.base64EncodedString()
           return base64String
        }else{
            return ""
        }
    }
}

struct MyData: TaggedPersistable {
    var tag: String
    var data: [String]
    
    var description : String {
        return "My tag is \(tag)"
    }
    
    init(_ tag: String){
        self.data = []
        self.tag = tag
        self.data.append(tag)
    }
    
    func showTags(){
        for tag in self.data{
            print(tag)
        }
    }
}

struct OutputData: TaggedEncodable {
    var data: [String]
    var tag: String
    
    init(_ tag: String){
        self.data = []
        self.tag = tag
        self.data.append(tag)
    }
}

let outputData1 = OutputData("text")
outputData1.base64


var data1 = MyData("test 1")
data1.persist(tag: "test 2")
