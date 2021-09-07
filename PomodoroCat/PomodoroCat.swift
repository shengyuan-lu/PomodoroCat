import SwiftUI

@main
struct PomodoroCat: App {
    
    // Local Storage Data
    @AppStorage("themeIndex") private var themeIndex = 1
    @AppStorage("work") private var work = 25
    @AppStorage("shortRest") private var shortRest = 5
    @AppStorage("longRest") private var longRest = 15
    @AppStorage("numOfSection") private var numOfSection = 4
    @AppStorage("catCoin") private var catCoin = 0
    
    // Entry Point For The App
    var body: some Scene {
        WindowGroup {
            MainView()
                .preferredColorScheme(determineTheme(themeIndex))
        }
    }
}
