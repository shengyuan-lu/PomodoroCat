import SwiftUI

struct TimerMainView: View {
    
    // MARK: - Variable
    @StateObject var taskManager = TaskManager()
    
    // MARK: - View
    var body: some View {
        
        NavigationView {
        ScrollView{
            
            TimerTitleView(taskManager: taskManager)
                .padding()
            
            VStack {
                TimerView(taskManager: taskManager)
                    .padding(40)
                
                ButtonSetView(taskManager: taskManager)
            }
            
            
        }
        .navigationTitle(Text("PomodoroCat"))
        .navigationBarTitleDisplayMode(.large)
            
        }
        
        
    }
    
}

// MARK: - Preview
struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        TimerMainView()
    }
}
