import Foundation
import Networking

class DataController {

    init(apiClient: ApiClientType,
         viewModel: AppViewModel) {
        self.apiClient = apiClient
        self.viewModel = viewModel
    }

    func configure() {
//        apiClient.fetchRequest(StatusApiRequest()) { [weak self] (statuses: [Status]) in
//            DispatchQueue.main.async {
//                self?.viewModel.statuses = statuses
//            }
//        }
        viewModel.statuses = Status.mocks
    }

    // MARK: - Privates

    private let apiClient: ApiClientType
    private let viewModel: AppViewModel

}
