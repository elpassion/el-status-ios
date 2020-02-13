struct Status: Codable {
    let statusType: StatusType
    let user: User

    enum CodingKeys: String, CodingKey {
        case statusType = "status_type"
        case user = "user"
    }
}
