protocol RequestApiType {
    var resourcePath: String { get }
    var method: RequestMethod { get }
    var params: [String: String] { get }
}

enum RequestMethod: String {
    case get = "GET"
}
