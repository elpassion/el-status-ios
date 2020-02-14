import Foundation
import Networking

class DataController {

    init(apiClient: ApiClientType,
         viewModel: AppViewModel) {
        self.apiClient = apiClient
        self.viewModel = viewModel
    }

    func configure() {
        refresh()
    }

    // MARK: - Privates

    private let apiClient: ApiClientType
    private let viewModel: AppViewModel

    private func refresh() {
        apiClient.fetchRequest(StatusApiRequest()) { [weak self] (statuses: [Status]) in
            DispatchQueue.main.async {
                self?.viewModel.statuses = statuses
            }
            DispatchQueue.global().asyncAfter(
                deadline: .now() + 2,
                execute: { self?.refresh() })
        }
    }

}
