import SwiftUI

struct StatusesView: View {
    @EnvironmentObject var viewModel: AppViewModel

    var body: some View {
        NavigationView {
            VStack {
                HStack {
                    SearchBar(text: $searchText)
                        .padding(.horizontal)
                }
                List {
                    ForEach(viewModel.statuses.filter { shouldShowStatus($0) }) { status in
                        StatusView(status)
                    }
                }
            }.navigationBarTitle("People finder")
        }
    }

    // MARK: - Privates

    @State private var searchText = ""
    private func shouldShowStatus(_ status: Status) -> Bool {
        guard !searchText.isEmpty else { return true }
        let input = "\(status.user.firstName)\(status.user.lastName)".lowercased()
        let capitalizedSearch = searchText.lowercased()
        return input.contains(capitalizedSearch)
    }

}

struct StatusesView_Previews: PreviewProvider {
    static var previews: some View {
        let viewModel = AppViewModel()
        viewModel.statuses = [Status(type: StatusType.remote,
                                             comment: "lekarz cały dzień",
                                             user: User(firstName: "Wojtek", lastName: "Nowak")),
                                      Status(type: StatusType.remote,
                                             comment: "lekarz cały dzień",
                                             user: User(firstName: "Michał", lastName: "Nowak")),
                                      Status(type: StatusType.remote,
                                             comment: "lekarz cały dzień",
                                             user: User(firstName: "Piotrek", lastName: "Nowak")),
                                      Status(type: StatusType.remote,
                                             comment: "lekarz cały dzień",
                                             user: User(firstName: "Maciej", lastName: "Nowak"))]
        return StatusesView().environmentObject(viewModel)
    }
}
