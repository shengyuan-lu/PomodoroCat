import Foundation
import SwiftUI

class TaskManager: ObservableObject {
    
    @Published var task = Task(pomodoroSeconds: 10, relaxSeconds: 2, pomodoroDegree: 120, relaxDegreeWithPomodoro: -90)
    
    @Published var isWorking = true
    
    func timerFirePerSecond() {
        if task.pomodoroSeconds != 0 {
            task.pomodoroSeconds -= 1
            
            task.pomodoroTo = CGFloat(task.pomodoroSeconds / (task.totalSeconds))
            
        } else if task.pomodoroSeconds == 0 && task.relaxSeconds != 0 {
            
            self.isWorking = false
            
            task.relaxSeconds -= 1
            
            task.relaxTo = CGFloat(task.relaxSeconds / (task.totalSeconds))
            
        }
    }
    
    func resetTask() {
        self.isWorking = false
        self.task = Task(pomodoroSeconds: 10, relaxSeconds: 2, pomodoroDegree: 120, relaxDegreeWithPomodoro: -90)
    }
    
}
