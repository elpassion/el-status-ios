import Networking

class Container {

    static let shared = Container()

    init() {
        dataController.configure()
    }

    lazy var dataController = DataController(apiClient: apiClient, viewModel: appViewModel)

    lazy var apiClient = ApiClient(requestBuilder: RequestBuilder(baseUrlProvider: BaseUrlProvider()),
                                   requestInterceptor: RequestInterceptor(userAccessToken: userAccessToken))

    let userAccessToken = UserAccessToken()
    let appViewModel = AppViewModel()

}
