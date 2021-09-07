import SwiftUI

struct TimerStats: View {
    
    // MARK: - Variable
    @ObservedObject var taskManager: TaskManager
    
    // MARK: - View
    var body: some View {
        
        VStack(alignment: .leading, spacing: 20) {
            Text("Work Duration: \(taskManager.task.taskStorage[0]) Minutes")
                .font(.body)
                .fontWeight(.bold)
                .foregroundColor(Color.primary)
                .lineLimit(1)
                .minimumScaleFactor(0.1)
            
            Text("Short Break Duration: \(taskManager.task.taskStorage[1]) Minutes")
                .font(.body)
                .fontWeight(.bold)
                .foregroundColor(Color.primary)
                .lineLimit(1)
                .minimumScaleFactor(0.1)
            
            Text("Long Break Duration: \(taskManager.task.taskStorage[2]) Minutes")
                .font(.body)
                .fontWeight(.bold)
                .foregroundColor(Color.primary)
                .lineLimit(1)
                .minimumScaleFactor(0.1)
            
            Text("Section Progress: \(taskManager.completedSection)/\(taskManager.task.numOfSections)")
                .font(.body)
                .fontWeight(.bold)
                .foregroundColor(Color.primary)
                .lineLimit(1)
                .minimumScaleFactor(0.1)
            
            Text("*1 work session and 1 short break session count as a section.")
                .font(.body)
                .fontWeight(.regular)
                .foregroundColor(Color.primary)
                .padding(.vertical, 20)
                .lineLimit(2)
                .minimumScaleFactor(0.1)

        }
        .frame(width: screenWidth / 1.2, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)

    }
}

// MARK: - Preview
struct TimerStats_Previews: PreviewProvider {
    static var previews: some View {
        TimerStats(taskManager: TaskManager())
    }
}
