import SwiftUI

struct Status: Codable, Equatable, Identifiable {
    let id = UUID()
    let type: StatusType
    let comment: String
    let dateModifiedString: String
    let user: User

    enum CodingKeys: String, CodingKey {
        case type = "type"
        case comment = "comment"
        case dateModifiedString = "date_modified"
        case user = "user"
    }
}
