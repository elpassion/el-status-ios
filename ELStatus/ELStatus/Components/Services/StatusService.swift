import Networking

protocol StatusServiceType {
    func getStatuses(completion: @escaping ([Status]) -> Void)
}

class StatusService: StatusServiceType {

    init(apiClient: ApiClientType) {
        self.apiClient = apiClient
    }

    // MARK: - StatusServiceType

    func getStatuses(completion: @escaping ([Status]) -> Void) {
        apiClient.fetchRequest(StatusApiRequest(), completion: completion)
    }

    // MARK - Privates

    private let apiClient: ApiClientType

}
