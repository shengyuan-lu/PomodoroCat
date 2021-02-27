import Foundation
import SwiftUI

struct Task: Equatable {
    var pomodoroSeconds:Float
    var relaxSeconds:Float
    var totalSeconds:Float
    
    var taskSecondStorage:[Float]
    
    var pomodoroTo:CGFloat
    var relaxTo:CGFloat
    
    var pomodoroDegree:Double
    var relaxDegreeWithPomodoro:Double
    
    init(pomodoroSeconds:Float, relaxSeconds:Float, pomodoroDegree:Double, relaxDegreeWithPomodoro:Double) {
        
        self.pomodoroSeconds = pomodoroSeconds
        self.relaxSeconds = relaxSeconds
        self.pomodoroDegree = pomodoroDegree
        self.relaxDegreeWithPomodoro = relaxDegreeWithPomodoro
        self.totalSeconds = pomodoroSeconds + relaxSeconds
        
        self.taskSecondStorage = [pomodoroSeconds, relaxSeconds]
        
        self.pomodoroTo = CGFloat(pomodoroSeconds / (totalSeconds))
        self.relaxTo = CGFloat(relaxSeconds / (totalSeconds))
        
    }
}
