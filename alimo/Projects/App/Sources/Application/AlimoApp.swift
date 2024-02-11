import SwiftUI

@main
struct AlimoApp: App {
    var body: some Scene {
        WindowGroup {
            NavigationStack {
                ContentView()
                    .environmentObject(TokenManager())
            }
        }
    }
}


private struct ContentView: View {
    
    @EnvironmentObject var tokenManager: TokenManager
    
    @State var opacity = 1.0
    
    var body: some View {
        ZStack {
            Group {
                if tokenManager.accessToken.isEmpty {
                    OnboardingFirstView()
                } else {
                    TabbarView()
                }
            }
            if opacity > 0 {
                LaunchScreenView()
                    .opacity(opacity)
                    .zIndex(1)
            }
        }
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
                withAnimation(.easeIn(duration: 0.3)) {
                    opacity = 0
                }
            }
        }
    }
}
