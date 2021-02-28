import SwiftUI

struct TimerView: View {
    
    // MARK: - Variable
    @State private var timer = Timer.publish(every: 0.5, on: .main, in: .common).autoconnect()
    
    @ObservedObject var taskManager:TaskManager
    
    // MARK: - View
    var body: some View {
        
        VStack {
            ZStack {
                
                VStack(spacing: 10) {
                    
                    Text("\(taskManager.getCurrentNumMin()) min")
                        .fontWeight(.bold)
                        .font(.system(size: 45))
                    
                    Text(taskManager.currentText)
                        .fontWeight(.light)
                        .font(.system(size: 30))
                    
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
                        .stroke(Color.green, style: StrokeStyle(lineWidth: screenWidth/15, lineCap: .round))
                    
                    // Button
                    Button(action: {
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
                    
                }
                
            }
            
        })
        .onChange(of: self.taskManager.timerStart, perform: { _ in
            if self.taskManager.timerStart == false {
                withAnimation {
                    
                }
            }
        })
        
    } // End of body
    
    
    // MARK: - Function
    
}


// MARK: - Preview
struct TimerView_Previews: PreviewProvider {
    static var previews: some View {
        TimerView(taskManager: TaskManager())
    }
}
