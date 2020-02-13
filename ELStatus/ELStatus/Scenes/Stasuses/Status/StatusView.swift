import SwiftUI

struct StatusView: View {
    init(_ status: Status) {
        self.status = status
    }

    var body: some View {
        HStack {
            Text("\(status.user.firstName) \(status.user.lastName)")
                .font(.headline)
                .padding(.leading)
            Spacer()
            Text("❝\(status.comment)❞")
                .font(.callout)
                .foregroundColor(.gray)
                .padding()
            Text(status.type.emoji)
                .padding(.trailing)
        }

    }

    // MARK: - Privates

    private let status: Status
}

struct StatusView_Previews: PreviewProvider {
    static var previews: some View {
        StatusView(Status.mocks.first!)
    }
}
