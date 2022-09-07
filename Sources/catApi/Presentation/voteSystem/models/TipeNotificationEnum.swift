enum TipeNotificationEnum {
    case Information 
    case Errors
    case Warning
    
    var icon: String {
        switch self {
            case .Information : return "🔵"
            case .Warning : return "🚧"
            case .Errors : return "⛔"
        }
    }
}