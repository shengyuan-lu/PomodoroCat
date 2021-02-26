import SwiftUI

struct TimerView: View {
    
    // MARK: - Variable
    @State var timerStart:Bool = true
    @State var isWorking: Bool = true
    
    @State private var timer = Timer.publish(every: 0.01, on: .main, in: .common).autoconnect()
    
    @State private var task = Task(pomodoroSeconds: 25*60, relaxSeconds: 5*60, pomodoroDegree: 120, relaxDegreeWithPomodoro: -90)
    
    // MARK: - View
    var body: some View {
        
        
        VStack {
            ZStack {
                ZStack {
                    Circle() // BG Gray Circle
                        .trim(from: 0, to: 1)
                        .stroke(Color.gray.opacity(0.3), style: StrokeStyle(lineWidth: screenWidth/10, lineCap: .round))
                    
                    Circle() // Relax Circle
                        .trim(from: 0, to: task.relaxTo)
                        .stroke(Color.green, style: StrokeStyle(lineWidth: screenWidth/15, lineCap: .round))
                        .rotationEffect(.init(degrees: task.relaxDegreeWithPomodoro))
                    
                    Circle() // Pomodoro Circle
                        .trim(from: 0, to: task.pomodoroTo)
                        .stroke(Color.pink, style: StrokeStyle(lineWidth: screenWidth/15, lineCap: .round))
                        .rotation3DEffect(
                            .degrees(180),
                            axis: (x: 1, y: 1, z: 0)
                        )
                        .rotationEffect(.degrees(task.pomodoroDegree), anchor: .center)
                        .rotation3DEffect(
                            .degrees(180),
                            axis: (x: 0, y: 1, z: 0)
                        )
                    
                }
                .frame(width: screenWidth/1.5, height: screenWidth/1.5, alignment: .center)
                
                VStack(spacing: 10) {
                    
                    Text("\(isWorking ? Int(ceil(task.pomodoroCentiSeconds / 100 / 60)) : Int(ceil(task.relaxCentiSeconds / 100 / 60))) min")
                        .fontWeight(.bold)
                        .font(.system(size: 40))
                    
                    Text(isWorking ? "Working" : "Relaxing")
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
            timerTick()
            
        })
        
    } // End of body
    
    // MARK: - Function
    func timerTick() {
        
    }
    
}


// MARK: - Preview
struct TimerView_Previews: PreviewProvider {
    static var previews: some View {
        TimerView()
    }
}
