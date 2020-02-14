import SwiftUI

struct StatusesView: View {
    @EnvironmentObject var viewModel: AppViewModel

    var body: some View {
        NavigationView {
            VStack {
                HStack {
                    SearchBar(text: $searchText)
                        .padding(.trailing, 24.0)
                        .padding(.leading)
                    Spacer()
                    ToggleButton(isOn: $isFavourite)
                        .padding(.trailing, 24.0)
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

    @State private var isFavourite = false
    @State private var searchText = ""

    private func shouldShowStatus(_ status: Status) -> Bool {
        let input = "\(status.user.firstName)\(status.user.lastName)".lowercased()
        let capitalizedSearch = searchText.lowercased()
        let containsSearchPhrase = searchText.isEmpty ? true : input.contains(capitalizedSearch)
        let isIdFavourite = isFavourite ? favouriteIds.contains(status.id) : true
        return containsSearchPhrase && isIdFavourite
    }

    private let favouriteIds = [1, 4, 7]

}

struct StatusesView_Previews: PreviewProvider {
    static var previews: some View {
        let viewModel = AppViewModel()
        viewModel.statuses = Status.mocks
        return StatusesView().environmentObject(viewModel)
    }
}
