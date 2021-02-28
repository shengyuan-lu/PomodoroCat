import SwiftUI
import Parse

@main
struct PomodoroCat: App {
    
    @AppStorage("themeIndex") private var themeIndex = 0
    
    @AppStorage("work") private var work = 25
    @AppStorage("shortRest") private var shortRest = 5
    @AppStorage("longRest") private var longRest = 15
    @AppStorage("numOfSection") private var numOfSection = 4
    
    @AppStorage("catCoin") private var catCoin = 0
    
    init() {
        let parseConfig = ParseClientConfiguration {
                    $0.applicationId = "onS2SH83bABDZAgHmXfxM4oxV6vDjwTq3K71jCNq"
                    $0.clientKey = "vlFHHJIqZ6lO5r6H3vQABE0t7P9cMfMUeds3QmWj"
                    $0.server = "https://parseapi.back4app.com"
            }
        Parse.initialize(with: parseConfig)
    }
    
    var body: some Scene {
        WindowGroup {
            LoginMainView()
                .preferredColorScheme(determineTheme(themeIndex))
        }
    }
}
