import SwiftUI

struct ToggleButton: View {
    @Binding var isOn: Bool

    init(isOn: Binding<Bool>) {
        _isOn = isOn
    }

    var body: some View {
        Button(
            action: { self.isOn.toggle() },
            label: { Text(self.isOn ? "💖" : "🤍") }
        )
    }
}
