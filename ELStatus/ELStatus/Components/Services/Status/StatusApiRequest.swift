import Networking

struct StatusApiRequest: ApiRequest {

    // MARK: - ApiRequest

    let resourcePath = "api/status"
    let method = ApiRequestMethod.get
    var params: [String : Any] {
        ["date": "20.02.2020"]
    }

}
