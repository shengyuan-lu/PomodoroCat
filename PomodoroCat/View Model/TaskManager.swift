import Foundation
import SwiftUI

class TaskManager: ObservableObject {
    
    @Published var isWorking = true
    
    @Published var isOnLongRelax = false
    
    @Published var timerStart = false
    
    @Published var completedSection = 0
    
    @Published var multiplierInfo:[Any] = [false, 2]
    
    @Published var task = Task()
    
    @Published var currentTo:CGFloat = 1
    
    @Published var currentSecond:CGFloat = 1
    
    @Published var currentText:String = "Tap to Start"
    
    var audioPlayer = AudioPlayer()
    
    func resetProject() {
        self.isWorking = true
        self.timerStart = false
        self.completedSection = 0
        
        self.task = Task()
    }
    
    
    func timerFired() {
        
        while self.completedSection < task.numOfSections {
            
            
            
            
        }
        
    }
    
    func getCurrentNumMin() -> Int {
        if task.workSeconds != 0 {
            return Int(task.workSeconds)
            
        } else if task.workSeconds == 0 && task.shortRelaxSeconds != 0 {
            
            return Int(task.shortRelaxSeconds)
            
        } else if task.shortRelaxSeconds == 0 {
            return 0
        }
        
        return 0
    }
    
    func addCatCoin() -> Int {
        if self.multiplierInfo[0] as! Bool == true {
            return 10 * (self.multiplierInfo[1] as! Int)
        } else {
            return 10
        }
    }
    
    
}
