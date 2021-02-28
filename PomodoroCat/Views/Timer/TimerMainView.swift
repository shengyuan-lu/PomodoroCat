import SwiftUI

struct TimerMainView: View {
    
    // MARK: - Variable
    @ObservedObject var taskManager:TaskManager
    
    // MARK: - View
    var body: some View {
        
        ScrollView {
            
            VStack {
                TimerTitleView(taskManager: taskManager)
                    .padding()
                
                TimerView(taskManager: taskManager)
                    .padding(40)
                
                Text("Section Progress: \(taskManager.completedSection)/\(taskManager.task.numOfSections)")
                    .font(.body)
                    .fontWeight(.bold)
                    .foregroundColor(Color.primary)
                    .padding(.vertical, 20)
                
            }

            
            // ButtonSetView(taskManager: taskManager)
        }
        
        
    }
    
}

// MARK: - Preview
struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        TimerMainView(taskManager: TaskManager())
    }
}
