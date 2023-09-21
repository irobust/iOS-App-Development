enum ActionError: Error{
    case OutofRange
    case UnknownError
}

func setAge(number: Int) throws -> Bool?{
    guard (number >= 0 && number <= 150) else {
        throw ActionError.OutofRange
    }
    
    return true
}

do{
    try setAge(number: 151)
} catch ActionError.OutofRange {
    print("number is out of range please input [0-150]")
} catch {
    print("Unkonn error")
}

if let _ = try? setAge(number: 150){
    print("Set aage is successful")
} else {
    print("Invalid age")
}
