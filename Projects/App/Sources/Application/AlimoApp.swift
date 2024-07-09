import SwiftUI
import ADS
import Foundation

@main
struct AlimoApp: App {
    
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(TokenManager())
                .environmentObject(DialogManager())
                .environmentObject(DownloadManager())
                .environmentObject(AppState())
                .environmentObject(ColorProvider(isDarkTheme: UserDefaults.standard.bool(forKey: "isDarkTheme")))
        }
    }
}


private struct ContentView: View {

    @EnvironmentObject var tokenManager: TokenManager
    @EnvironmentObject var dm: DialogManager
    @State var opacity = 1.0
    
    var body: some View {
        ZStack {
            Group {
                if tokenManager.accessToken.isEmpty {
                    OnboardingFirstView()
                } else {
                    MainView()
                }
            }
            if dm.phase == .show {
                Color.black.opacity(0.3)
                    .ignoresSafeArea()
            }
            if opacity > 0 {
                LaunchScreenView()
                    .opacity(opacity)
                    .zIndex(1)
            }
        }
        .onAppear {
            tokenManager.accessToken = UserDefaults.standard.string(forKey: "accessToken") ?? ""
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
                withAnimation(.easeIn(duration: 0.3)) {
                    opacity = 0
                }
            }
        }
    }
}
