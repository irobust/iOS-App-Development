enum GlassSize: Int{
    case small  = 1
    case medium
    case large
    case xlarge
    case xxlarge
    
    func getDescription() -> String {
        switch self {
        case .small:
            return "Small size"
        case .medium:
            return "Medium size"
        case .large:
            return "Large size"
        case .xlarge:
            return "Extra Large size"
        case .xxlarge:
            return "Suprer Extra Large"
        }
    }
}

let size = GlassSize.xlarge

print(size)
print(size.rawValue)

let selectedSize = GlassSize.xlarge
if selectedSize == GlassSize.xlarge {
    print("You selected small size")
}

print("You selected \(GlassSize.xlarge.getDescription())")


print(GlassSize.small.getDescription())

let size2: GlassSize = GlassSize.medium

switch size2 {
case GlassSize.small:
    print("You selected small size")
case GlassSize.medium:
    print("You selected medium size")
case GlassSize.large:
    print("You selected large size")
case GlassSize.xlarge:
    print("You selected Extra large size")
case GlassSize.xxlarge:
    print("You selected Super Extra Large size")
}

enum ServerResponse {
    case success(String)
    case failure(String)
}

let serverResponse = ServerResponse.failure("Bad srequest")

switch serverResponse{
case let .failure(message):
    print("Error: \(message)")
case let .success(message):
    print("Success: \(message)")
}
