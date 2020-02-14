import SwiftUI

struct AppView: View {
    @EnvironmentObject var viewModel: AppViewModel

    var body: some View {
        TabView {
            StatusesView().environmentObject(viewModel)
                .tabItem {
                    Image(systemName: "person.3.fill")
                    Text("Finder")
                }.tag(0)
            Image("proj")
                .tabItem {
                    Image(systemName: "pencil")
                    Text("My Status")
                }.tag(1)
        }
        
    }
}

struct AppViewView_Previews: PreviewProvider {
    static var previews: some View {
        let viewModel = AppViewModel()
        viewModel.statuses = Status.mocks
        return AppView().environmentObject(viewModel)
    }
}
