import Foundation
import SwiftUI

class TaskManager: ObservableObject {
    
    @Published var task = Task(pomodoroSeconds: 2.5, relaxSeconds: 0.5, pomodoroDegree: 120, relaxDegreeWithPomodoro: -90)
    
}
