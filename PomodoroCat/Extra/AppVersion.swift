import Foundation

struct AppVersion {
    static let version = Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String
    static let build = Bundle.main.infoDictionary?["CFBundleVersion"] as? String
}
