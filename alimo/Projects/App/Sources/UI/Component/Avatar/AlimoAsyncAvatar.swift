import SwiftUI
import NukeUI

struct AlimoAsyncAvatar: View {
    
    var url: String?
    var type: AlimoAvatarType
    
    init(
        _ url: String?,
        type: AlimoAvatarType = .medium
    ) {
        self.url = url
        self.type = type
    }
    
    var body: some View {
        LazyImage(url: .init(string: url ?? "")) { state in
            if let image = state.image {
                image
            } else if state.error != nil {
                AlimoAvatar(type: type)
            } else {
                makeShimmer()
            }
        }
        .processors([.resize(size: .init(width: type.size, height: type.size), unit: .pixels)])
        .clipShape(Circle())
    }
    
    func makeShimmer() -> some View {
        Circle()
            .foregroundStyle(Color.gray300)
            .frame(width: type.size, height: type.size)
            .shimmer()
    }
}
