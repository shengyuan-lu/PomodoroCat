import Foundation
import SwiftUI

struct Task: Equatable {
    var workSeconds:Int
    var shortRelaxSeconds:Int
    var longRelaxSeconds:Int
    var numOfSections:Int
    
    let oneSectionTotalSeconds:Int
    let storage:[Int]
    
    init(workSeconds:Int = 25, shortRelaxSeconds:Int = 5, longRelaxSeconds:Int = 15, numOfSections:Int = 4) {
        
        self.workSeconds = workSeconds
        self.shortRelaxSeconds = shortRelaxSeconds
        self.longRelaxSeconds = longRelaxSeconds
        self.numOfSections = numOfSections
        self.oneSectionTotalSeconds = workSeconds + shortRelaxSeconds
        
        storage = [workSeconds, shortRelaxSeconds, longRelaxSeconds, numOfSections]
    }
}
