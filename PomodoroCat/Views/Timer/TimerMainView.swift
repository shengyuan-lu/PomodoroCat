import SwiftUI

struct TimerMainView: View {
    
    // MARK: - Variable
    @State private var timerStart:Bool = false
    
    @StateObject var taskManager = TaskManager()
    
    // MARK: - View
    var body: some View {
        
        ScrollView {
            
            TimerView(timerStart: $timerStart, taskManager: taskManager)
                .padding(40)
            
            Button(action: {
                timerStart.toggle()
            }, label: {
                Text(timerStart ? "Stop" : "Start")
            })
        }
        
    }
}

// MARK: - Preview
struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        TimerMainView()
    }
}
