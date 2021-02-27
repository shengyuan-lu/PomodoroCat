import Foundation
import SwiftUI

class TaskManager: ObservableObject {
    
    @Published var task = Task(pomodoroSeconds: 25, relaxSeconds: 5, pomodoroDegree: 120, relaxDegreeWithPomodoro: -90)
    
    @Published var isWorking = true
    
    @Published var timerStart = false
    
    @Published var completedNum = 0
    
    var audioPlayer = AudioPlayer()
    
    func timerFirePerSecond() {

        if task.pomodoroSeconds != 0 {
            task.pomodoroSeconds -= 1
            
            task.pomodoroTo = CGFloat(task.pomodoroSeconds / (task.totalSeconds))
            
        } else if task.pomodoroSeconds == 0 && task.relaxSeconds != 0 {
            
            self.isWorking = false
            
            task.relaxSeconds -= 1
            
            task.relaxTo = CGFloat(task.relaxSeconds / (task.totalSeconds))
            
        } else if task.relaxSeconds == 0 {
            self.resetTask()
        }
        
        checkIfPlayAudio()
    }
    
    func checkIfPlayAudio() {
        if task.pomodoroTo == 0 && task.relaxTo == 0 {
            
            self.audioPlayer.startPlayBack(audioUrl: AudioURL.done!)
            
        }
    }
    
    func resetTask() {
        self.isWorking = true
        self.timerStart = false
        self.task = Task(pomodoroSeconds: 25, relaxSeconds: 5, pomodoroDegree: 120, relaxDegreeWithPomodoro: -90)
    }
    
    func getCurrentNumMin() -> Int {
        if task.pomodoroSeconds != 0 {
            return Int(task.pomodoroSeconds)
            
        } else if task.pomodoroSeconds == 0 && task.relaxSeconds != 0 {
            
            return Int(task.relaxSeconds)
            
        } else if task.relaxSeconds == 0 {
            return 0
        }
        
        return 0
    }
}
