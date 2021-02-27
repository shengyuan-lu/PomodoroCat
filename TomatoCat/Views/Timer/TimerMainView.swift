import SwiftUI

struct TimerMainView: View {
    
    // MARK: - Variable
    @State private var timerStart:Bool = false
    
    @StateObject var taskManager = TaskManager()
    
    // MARK: - View
    var body: some View {
        
        NavigationView {
            ScrollView {
                
                Divider()
                    .padding()
                
                TimerView(timerStart: $timerStart, taskManager: taskManager)
                
                Button(action: {
                    timerStart.toggle()
                }, label: {
                    Text(timerStart ? "Stop" : "Start")
                })
            }
            .navigationBarTitle(Text("PomodoroCat"))
            .navigationBarTitleDisplayMode(.inline)
        }

    }
}

// MARK: - Preview
struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        TimerMainView()
    }
}
