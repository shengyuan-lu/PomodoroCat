import SwiftUI
import Firebase

@main
struct PomodoroCat: App {
    init() {
        FirebaseApp.configure()
    }
    @AppStorage("themeIndex") private var themeIndex = 1
    var body: some Scene {
        WindowGroup {
            MainView()
                .preferredColorScheme(determineTheme(themeIndex))
        }
    }
}
