import SwiftUI

struct NotificationCellShimmer: View {
    
    @ViewBuilder
    private var avatar: some View {
//        AlimoAvatar()
//        .toTop()
        EmptyView() // // TODO: Add view
    }
    
    @ViewBuilder
    private var profile: some View {
        ProfileCeil(isNew: false, title: "----------", membername: "---")
    }
    
    @ViewBuilder
    private var content: some View {
        Text(Array(repeating: "-", count: .random(in: 40..<100)).joined())
//            .font(.label) // TODO: fix font
            .foregroundColor(.main900)
            .fixedSize(horizontal: false, vertical: true)
            .multilineTextAlignment(.leading)
            .lineSpacing(5)
    }
    
    @ViewBuilder
    private var info: some View {
        Text("-------")
            .foregroundStyle(Color.gray500)
//            .font(.cute) // TODO: fix font
            .padding(.top, 12)
    }
    
    var body: some View {
        HStack(spacing: 0) {
            avatar
            VStack(alignment: .leading, spacing: 0) {
                VStack(alignment: .leading, spacing: 0) {
                    profile
                    content
                        .padding(.top, 12)
                }
                info
            }
            .padding(.leading, 8)
        }
        .padding(.leading, 12)
        .padding(.top, 20)
        .padding(.trailing, 16)
        .padding(.bottom, 12)
    }
}
