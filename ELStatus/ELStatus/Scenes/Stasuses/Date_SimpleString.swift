import Foundation

extension Date {
    func toSimpleDataString() -> String {
        guard self != .distantPast else { return "" }
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "en_US_POSIX")
        dateFormatter.dateFormat = "HH:mm"
        return dateFormatter.string(from: self)
    }
}
