import SwiftUI

struct Status: Codable, Equatable, Identifiable {
    let id: Int
    let type: StatusType
    let comment: String
    let dateModifiedString: String
    let user: User

    enum CodingKeys: String, CodingKey {
        case id = "user_id"
        case type = "type"
        case comment = "comment"
        case dateModifiedString = "date_modified"
        case user = "user"
    }
}
