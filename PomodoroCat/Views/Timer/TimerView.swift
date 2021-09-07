import SwiftUI

struct TimerView: View {
    
    // MARK: - Variable
    @State private var timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    @ObservedObject var taskManager: TaskManager
    
    @AppStorage("work") private var work = 25
    @AppStorage("shortRest") private var shortRest = 5
    @AppStorage("longRest") private var longRest = 15
    @AppStorage("numOfSection") private var numOfSection = 4
    
    @State var audioPlayer = AudioPlayer()
    
    // MARK: - View
    var body: some View {
        
        VStack {
            ZStack {
                VStack(spacing: 10) {
                    
                    if taskManager.timerStart {
                        Text("\(taskManager.currentMinute) min")
                            .fontWeight(.bold)
                            .font(.system(size: 45))
                    }
                    
                    Text(taskManager.currentText)
                        .fontWeight(.light)
                        .font(.system(size: 30))
                        .lineLimit(1)
                        .minimumScaleFactor(0.1)
                    
                }
                .frame(width: screenWidth/2.6, height: screenWidth/2.6, alignment: .center)
                .scaledToFill()
                .multilineTextAlignment(.leading)
                .lineLimit(1)
                
                ZStack {
                    
                    // BG Gray Circle
                    Circle()
                        .trim(from: 0, to: 1)
                        .stroke(Color.gray.opacity(0.3), style: StrokeStyle(lineWidth: screenWidth/10, lineCap: .round))
                    
                    // Active Timer Circle
                    Circle()
                        .trim(from: 0, to: taskManager.currentTo)
                        .stroke(taskManager.currentColor, style: StrokeStyle(lineWidth: screenWidth/15, lineCap: .round))
                        .rotationEffect(.degrees(-90))
                    
                    // Button
                    Button(action: {
                        self.audioPlayer.startPlayBack(audioUrl: AudioURL.toggleOn!)
                        taskManager.timerStart.toggle()
                    }, label: {
                        Circle() // BG Gray Circle
                            .trim(from: 0, to: 1)
                            .foregroundColor(Color.clear)
                    })
                    
                }
                .frame(width: screenWidth/1.5, height: screenWidth/1.5, alignment: .center)
                
                
            }
            
        }
        .onReceive(self.timer, perform: { _ in
            if self.taskManager.timerStart {
                
                withAnimation {
                    taskManager.timerFired()
                }
                
            }
        })
        .onChange(of: self.taskManager.timerStart, perform: { _ in
            if !self.taskManager.timerStart {
                withAnimation {
                    taskManager.resetTimer()
                }
            }
        })
        
    } // End of body
    
    
    // MARK: - Function
    // None
    
}


// MARK: - Preview
struct TimerView_Previews: PreviewProvider {
    static var previews: some View {
        TimerView(taskManager: TaskManager())
    }
}
