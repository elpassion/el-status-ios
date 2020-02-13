import SwiftUI

class AppViewModel: ObservableObject {
    @Published var statuses: [Status] = []
}
