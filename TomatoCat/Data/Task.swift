import Foundation
import SwiftUI

struct Task: Equatable {
    var pomodoroSeconds:Float
    var relaxSeconds:Float
    
    var pomodoroCentiSeconds:Float
    var relaxCentiSeconds:Float
    
    var pomodoroTo:CGFloat
    var relaxTo:CGFloat
    
    var pomodoroDegree:Double
    var relaxDegreeWithPomodoro:Double
    
    init(pomodoroSeconds:Float, relaxSeconds:Float, pomodoroDegree:Double, relaxDegreeWithPomodoro:Double) {
        
        self.pomodoroSeconds = pomodoroSeconds
        self.relaxSeconds = relaxSeconds
        self.pomodoroDegree = pomodoroDegree
        self.relaxDegreeWithPomodoro = relaxDegreeWithPomodoro
        
        pomodoroCentiSeconds = pomodoroSeconds * 100
        relaxCentiSeconds = relaxSeconds * 100
        
        pomodoroTo = CGFloat(pomodoroSeconds / (pomodoroSeconds + relaxSeconds))
        relaxTo = CGFloat(relaxSeconds / (pomodoroSeconds + relaxSeconds))
        
    }
}
