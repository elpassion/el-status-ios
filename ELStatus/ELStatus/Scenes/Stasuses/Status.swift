import SwiftUI

struct Status: Codable, Equatable, Identifiable {
    let id = UUID()
    let type: StatusType
    let comment: String
    let user: User
}
