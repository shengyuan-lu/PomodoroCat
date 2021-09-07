import SwiftUI

struct ButtonSetView: View {
    
    // MARK: - Variables
    @ObservedObject var taskManager: TaskManager
    
    // MARK: - View
    var body: some View {
        
        // Record Button
        Button(action: {
            taskManager.timerStart.toggle()
        }, label: {
            VStack(spacing: 10) {
                Image(systemName: taskManager.timerStart ? "stop.fill" : "play.fill")
                    .foregroundColor(.white)
                
            }
            .padding(.vertical)
            .font(.system(size: 25))
            .minimumScaleFactor(0.1)
            .frame(width: screenWidth/5, height: screenWidth/5, alignment: .center)
            .background(Color.pink)
            .clipShape(Circle())
        })
    }
}

// MARK: - Preview
struct ButtonSetView_Previews: PreviewProvider {
    static var previews: some View {
        ButtonSetView(taskManager: TaskManager())
    }
}
