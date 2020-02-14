import SwiftUI

struct StatusView: View {
    init(_ status: Status) {
        self.status = status
    }

    var body: some View {
        HStack {
            Text("\(status.user.firstName) \(status.user.lastName)")
                .frame(width: 120, height: nil, alignment: Alignment.leading)
                .font(.headline)
                .foregroundColor(isDefaultStatus ? .gray : .black)
            VStack {
                if !isDefaultStatus {
                    HStack {
                        Text("❝\(status.comment)❞")
                            .font(.callout)
                            .foregroundColor(.gray)
                            .multilineTextAlignment(.leading)
                            .padding(.leading)
                        Spacer()
                    }
                    HStack {
                        Spacer()
                        Text("🕓 last update:  \(status.dateModifiedString.toDate().toSimpleDataString())")
                            .font(.caption)
                            .foregroundColor(Color.gray)
                            .padding([.top, .trailing])
                    }
                }
            }
            Spacer()
            Text(status.type.emoji)
                .padding(.trailing)
        }

    }

    // MARK: - Privates

    private let status: Status
    private var isDefaultStatus: Bool {
        status.type == .office
    }
}

struct StatusView_Previews: PreviewProvider {
    static var previews: some View {
        StatusView(Status.mocks.first!)
    }
}
