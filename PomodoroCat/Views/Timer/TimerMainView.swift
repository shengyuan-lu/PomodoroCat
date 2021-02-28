import SwiftUI

struct TimerMainView: View {
    
    // MARK: - Variable
    @ObservedObject var taskManager:TaskManager
    
    // MARK: - View
    var body: some View {
        
        ScrollView {
            TimerTitleView(taskManager: taskManager)
                .padding()
            
            TimerView(taskManager: taskManager)
                .padding(40)
        }
        
        
    }
    
}

// MARK: - Preview
struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        TimerMainView(taskManager: TaskManager())
    }
}
