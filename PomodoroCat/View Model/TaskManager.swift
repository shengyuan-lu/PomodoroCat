import Foundation
import SwiftUI

class TaskManager: ObservableObject {
    
    @Published var isWorking = true
    @Published var isOnLongRelax = false
    @Published var timerStart = false
    @Published var completedSection = 0
    @Published var multiplierInfo: [Any] = [false, 2]
    @Published var task: Task = Task()
    @Published var currentTo: CGFloat = 1
    @Published var currentMinute: Int = 1
    @Published var currentColor: Color = Color.blue
    @Published var currentText: String = "Tap to Start"
    @Published var catCoin = 0
    
    var audioPlayer = AudioPlayer()
    
    func timerFired() {
        
        // Sections
        if completedSection < task.taskStorage[3] {
            
            // There are unfinished section
            
            if task.workSeconds != 0 {
                // Working
                
                // Working session initialization
                if task.workSeconds == task.taskStorage[0] {
                    currentText = "Work"
                    currentTo = 1
                    currentColor = Color.blue
                    currentMinute = task.workSeconds
                }
                
                task.workSeconds -= 1
                currentMinute = task.workSeconds
                self.currentTo -= CGFloat( 1 / Double(task.taskStorage[0]))
                
                // Working session ends, play done sound and add catcoin
                if task.workSeconds == 0 {
                    audioPlayer.startPlayBack(audioUrl: AudioURL.done!)
                    self.addCatCoin(amount: 20)
                }
                
                
            } else if task.workSeconds == 0 && task.shortRelaxSeconds != 0 {
                // Short relaxing
                
                // Relaxing session initialization
                if task.shortRelaxSeconds == task.taskStorage[1] {
                    currentText = "Short Break"
                    currentTo = 1
                    currentColor = Color.green
                    currentMinute = task.shortRelaxSeconds
                }
                
                task.shortRelaxSeconds -= 1
                currentMinute = task.shortRelaxSeconds
                self.currentTo -= CGFloat( 1 / Double(task.taskStorage[1]))
                
                // Short relax session ends, play done sound and add catcoin
                if task.shortRelaxSeconds == 0 {
                    audioPlayer.startPlayBack(audioUrl: AudioURL.done!)
                    self.addCatCoin(amount: 5)
                }
                
            } else if task.shortRelaxSeconds == 0 {
                // This section has ended!
                completedSection += 1
                
                if completedSection != task.taskStorage[3] {
                    task.workSeconds = task.taskStorage[0]
                    task.shortRelaxSeconds = task.taskStorage[1]
                    currentColor = Color.blue
                    currentText = "Work"
                    
                } else if completedSection == task.taskStorage[3] {
                    currentColor = Color.orange
                    currentText = "Long Break"
                }
                currentTo = 1
            }
            
            // Long relaxing
            
        } else if completedSection == task.taskStorage[3] && task.longRelaxSeconds != 0 {
            // Long relaxing initialization
            if task.longRelaxSeconds == task.taskStorage[2] {
                currentText = "Long Break"
                currentTo = 1
                currentColor = Color.orange
                currentMinute = task.longRelaxSeconds
            }
            
            task.longRelaxSeconds -= 1
            currentMinute = task.longRelaxSeconds
            self.currentTo -= CGFloat( 1 / Double(task.taskStorage[2]))
            
            // Long relax ends, play done sound and add coin
            if task.longRelaxSeconds == 0 {
                audioPlayer.startPlayBack(audioUrl: AudioURL.done!)
                self.addCatCoin(amount: 10)
            }
            
        } else if task.longRelaxSeconds == 0 {
            // The project has ended, reset
            resetTimer()
        }
    }
    
    func resetTimer() {
        
        if (task.workSeconds == task.taskStorage[0]) && (multiplierInfo[0] as! Bool == true) {
            // Do Nothing, the boost purchased is still effective
        } else {
            multiplierInfo = [false, 2]
        }
        
        self.timerStart = false
        completedSection = 0
        currentTo = 1
        task.workSeconds = task.taskStorage[0]
        task.shortRelaxSeconds = task.taskStorage[1]
        task.longRelaxSeconds = task.taskStorage[2]
        currentMinute = task.workSeconds
        currentColor = Color.blue
        currentText = "Tap to Start"
    }
    
    func addCatCoin(amount: Int) {
        if self.multiplierInfo[0] as! Bool == true {
            self.catCoin += (amount * (self.multiplierInfo[1] as! Int))
            
        } else {
            self.catCoin += amount
        }
    }
    
}
