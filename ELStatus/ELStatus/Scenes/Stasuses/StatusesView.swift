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
                    ForEach(viewModel.statuses
                        .sorted(by: { $0.dateModifiedString.toDate() > $1.dateModifiedString.toDate() })
                        .filter { shouldShowStatus($0) }) { status in
                        StatusView(status)
                    }
                }
            }.navigationBarTitle("People finder 👬👬👬")
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
        viewModel.statuses = Status.mocks
        return StatusesView().environmentObject(viewModel)
    }
}
