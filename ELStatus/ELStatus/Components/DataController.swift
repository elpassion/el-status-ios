import Foundation
import Networking

class DataController {

    init(apiClient: ApiClientType,
         viewModel: AppViewModel) {
        self.apiClient = apiClient
        self.viewModel = viewModel
    }

    func configure() {
        apiClient.fetchRequest(StatusApiRequest()) { [weak self] (statuses: [Status]) in
            DispatchQueue.main.async {
                self?.viewModel.statuses = statuses
            }
        }
//        viewModel.statuses =
//        [Status(type: StatusType.off,
//               comment: "test comment 1",
//               user: User(firstName: "Wojtek",
//                          lastName: "Nowak")),
//        Status(type: StatusType.remote,
//               comment: "test comment 2",
//               user: User(firstName: "Kewin",
//                          lastName: "Sam w domu")),
//        Status(type: StatusType.sickLeave,
//               comment: "test comment 3",
//               user: User(firstName: "Filip",
//                          lastName: "Gryn"))]
    }

    // MARK: - Privates

    private let apiClient: ApiClientType
    private let viewModel: AppViewModel

}
