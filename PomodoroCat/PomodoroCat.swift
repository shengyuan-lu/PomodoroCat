import SwiftUI
import Firebase

@main
struct PomodoroCat: App {
    init() {
        FirebaseApp.configure()
    }
    var body: some Scene {
        WindowGroup {
            MainView()
        }
    }
}
