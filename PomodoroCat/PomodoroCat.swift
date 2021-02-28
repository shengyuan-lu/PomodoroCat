import SwiftUI

@main
struct PomodoroCat: App {
    
    @AppStorage("themeIndex") private var themeIndex = 1
    
    var body: some Scene {
        WindowGroup {
            MainView()
                .preferredColorScheme(determineTheme(themeIndex))
        }
    }
}
