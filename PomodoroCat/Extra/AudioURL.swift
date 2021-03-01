import Foundation

struct AudioURL {
    static let done = Bundle.main.url(forResource: "done", withExtension: "wav")
    static let toggleOn = Bundle.main.url(forResource: "clickto", withExtension: "wav")
    static let toggleOff = Bundle.main.url(forResource: "clickback", withExtension: "wav")
    static let buy = Bundle.main.url(forResource: "buy-success", withExtension: "wav")
    static let buyFail = Bundle.main.url(forResource: "buy-fail", withExtension: "wav")
    static let catSound = Bundle.main.url(forResource: "cat-sound", withExtension: "wav")
}
