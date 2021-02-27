import SwiftUI

struct TimerView: View {
    
    // MARK: - Variable
    @Binding var timerStart: Bool
    
    @State private var timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    @ObservedObject var taskManager:TaskManager
    
    // MARK: - View
    var body: some View {
        
        
        VStack {
            ZStack {
                ZStack {
                    Circle() // BG Gray Circle
                        .trim(from: 0, to: 1)
                        .stroke(Color.gray.opacity(0.3), style: StrokeStyle(lineWidth: screenWidth/10, lineCap: .round))
                    
                    Circle() // Relax Circle
                        .trim(from: 0, to: taskManager.task.relaxTo)
                        .stroke(Color.green, style: StrokeStyle(lineWidth: screenWidth/15, lineCap: .round))
                        .rotationEffect(.init(degrees: taskManager.task.relaxDegreeWithPomodoro))
                    
                    Circle() // Pomodoro Circle
                        .trim(from: 0, to: taskManager.task.pomodoroTo)
                        .stroke(Color.pink, style: StrokeStyle(lineWidth: screenWidth/15, lineCap: .round))
                        .rotation3DEffect(
                            .degrees(180),
                            axis: (x: 1, y: 1, z: 0)
                        )
                        .rotationEffect(.degrees(taskManager.task.pomodoroDegree), anchor: .center)
                        .rotation3DEffect(
                            .degrees(180),
                            axis: (x: 0, y: 1, z: 0)
                        )
                    
                }
                .frame(width: screenWidth/1.5, height: screenWidth/1.5, alignment: .center)
                
                VStack(spacing: 10) {
                    
                    Text("min")
                        .fontWeight(.bold)
                        .font(.system(size: 45))
                    
                    Text(taskManager.isWorking ? "Working" : "Relaxing")
                        .fontWeight(.light)
                        .font(.system(size: 30))
                    
                }
                .frame(width: screenWidth/2.6, height: screenWidth/2.6, alignment: .center)
                .scaledToFill()
                .multilineTextAlignment(.leading)
                .lineLimit(1)
                
            }
            
        }
        .onReceive(self.timer, perform: { _ in
            
            if timerStart {
                
                withAnimation {
                    taskManager.timerFirePerSecond()
                }
                
            }
            
        })
        .onChange(of: self.timerStart, perform: { _ in
            if self.timerStart == false {
                withAnimation {
                    taskManager.resetTask()
                }
            }
        })
        
    } // End of body
    
    
    // MARK: - Function
    
}


// MARK: - Preview
struct TimerView_Previews: PreviewProvider {
    static var previews: some View {
        TimerView(timerStart: Binding.constant(false), taskManager: TaskManager())
    }
}
