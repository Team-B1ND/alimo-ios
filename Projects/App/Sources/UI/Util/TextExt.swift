import SwiftUI

public extension Text {
    func applyOpenURL() -> some View {
        self
            .environment(\.openURL, OpenURLAction { url in
                return .systemAction
            })
    }
}
