import Foundation

struct AudioURL {
    static let done = Bundle.main.url(forResource: "done", withExtension: "wav")
    static let toggleOn = Bundle.main.url(forResource: "clickto", withExtension: "wav")
    static let toggleOff = Bundle.main.url(forResource: "clickback", withExtension: "wav")
    static let buy = Bundle.main.url(forResource: "buy", withExtension: "wav")
    static let buyFail = Bundle.main.url(forResource: "fail", withExtension: "wav")
}
