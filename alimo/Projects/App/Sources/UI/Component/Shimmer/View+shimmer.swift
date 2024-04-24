import SwiftUI

public extension View {
    
    @ViewBuilder
    func shimmer(_ condition: Bool = true) -> some View {
        if condition {
            AlimoShimmer { self }
        } else {
            self
        }
    }
}
