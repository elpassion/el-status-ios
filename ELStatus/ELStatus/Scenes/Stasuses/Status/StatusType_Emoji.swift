extension StatusType {
    var emoji: String {
        switch self {
        case .off: return "🌴"
        case .sickLeave: return "🤧"
        case .office: return "👨‍💼"
        case .remote: return "🏡"
        }
    }
}
