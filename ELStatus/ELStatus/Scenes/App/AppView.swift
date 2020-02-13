import SwiftUI

struct AppView: View {
    @EnvironmentObject var viewModel: AppViewModel

    var body: some View {
        TabView {
            StatusesView().environmentObject(viewModel)
                .tabItem {
                    Image(systemName: "1.circle")
                    Text("First")
                }.tag(0)
            Text("Second View")
                .tabItem {
                    Image(systemName: "2.circle")
                    Text("Second")
                }.tag(1)
        }
        
    }
}

struct AppViewView_Previews: PreviewProvider {
    static var previews: some View {
        let viewModel = AppViewModel()
        viewModel.statuses = [Status(type: StatusType.off,
                                     comment: "test comment 1",
                                     user: User(firstName: "FirstName1",
                                                lastName: "LastName1")),
                              Status(type: StatusType.off,
                                     comment: "test comment 2",
                                     user: User(firstName: "FirstName2",
                                                lastName: "LastName2")),
                              Status(type: StatusType.off,
                                     comment: "test comment 3",
                                     user: User(firstName: "FirstName3",
                                                lastName: "LastName4"))]
        return AppView().environmentObject(viewModel)
    }
}
