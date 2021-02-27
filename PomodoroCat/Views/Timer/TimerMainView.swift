import SwiftUI

struct TimerMainView: View {
    
    // MARK: - Variable
    @StateObject var taskManager = TaskManager()
    
    // MARK: - View
    var body: some View {
        
        ScrollView {
            
            TimerView(taskManager: taskManager)
                .padding(40)
            
            Button(action: {
                taskManager.timerStart.toggle()
            }, label: {
                Text(taskManager.timerStart ? "Stop" : "Start")
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
