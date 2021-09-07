import SwiftUI

struct TimerMainView: View {
    
    // MARK: - Variable
    @ObservedObject var taskManager:TaskManager
    @AppStorage("work") private var work = 25
    @AppStorage("shortRest") private var shortRest = 5
    @AppStorage("longRest") private var longRest = 15
    @AppStorage("numOfSection") private var numOfSection = 4
    
    // MARK: - View
    var body: some View {
        
        ScrollView {
            VStack {
                HStack {
                    Text("Section Completed:")
                        .font(.body)
                        .fontWeight(.bold)
                        .foregroundColor(Color.primary)
                        
                    Spacer()
                    
                    Text("\(taskManager.completedSection) / \(taskManager.task.numOfSections)")
                        .font(.body)
                        .fontWeight(.bold)
                        .foregroundColor(Color.primary)
                }
                .padding(.vertical, 5)
                .padding(.horizontal, 25)
                .padding(.bottom, 5)
                
                
                TimerView(taskManager: taskManager)
                    .padding(20)
                
                VStack {
                    NavigationLink(
                        destination: TimerPickerView(bindingNum: $work, selectionIndex: (work - 10), lowerBound: 10, upperBound: 60, unit: "Minutes"),
                        label: {
                            TimerSettingsRow(iconName: "hammer.fill", iconColor: Color.blue, firstText: "Work", secondText: "\(work) Minutes")
                                .padding(.vertical, 3)
                                .buttonStyle(PlainButtonStyle())
                        }).id(UUID())
                    
                    NavigationLink(
                        destination: TimerPickerView(bindingNum: $shortRest, selectionIndex: (shortRest - 5), lowerBound: 5, upperBound: 30, unit: "Minutes"),
                        label: {
                            TimerSettingsRow(iconName: "die.face.3.fill", iconColor: Color.green, firstText: "Short Break", secondText: "\(shortRest) Minutes")
                                .padding(.vertical, 3)
                                .buttonStyle(PlainButtonStyle())
                        }).id(UUID())
                    
                    NavigationLink(
                        destination: TimerPickerView(bindingNum: $longRest, selectionIndex: (longRest - 15), lowerBound: 15, upperBound: 90, unit: "Minutes"),
                        label: {
                            TimerSettingsRow(iconName: "bed.double.fill", iconColor: Color.orange, firstText: "Long Break", secondText: "\(longRest) Minutes")
                                .padding(.vertical, 3)
                                .buttonStyle(PlainButtonStyle())
                        }).id(UUID())
                    
                    NavigationLink(
                        destination: TimerPickerView(bindingNum: $numOfSection, selectionIndex: (numOfSection - 2), lowerBound: 2, upperBound: 10, unit: "Sections"),
                        label: {
                            TimerSettingsRow(iconName: "rectangle.stack", iconColor: Color.red, firstText: "Sections", secondText:"\(numOfSection)")
                                .padding(.vertical, 3)
                                .buttonStyle(PlainButtonStyle())
                        }).id(UUID())
                }
                .padding()
            }
            // ButtonSetView(taskManager: taskManager)
        }
        .onChange(of: work, perform: { value in
            taskManager.task = Task(workSeconds: work, shortRelaxSeconds: shortRest, longRelaxSeconds: longRest, numOfSections: numOfSection)
            taskManager.resetTimer()
        })
        .onChange(of: shortRest, perform: { value in
            taskManager.task = Task(workSeconds: work, shortRelaxSeconds: shortRest, longRelaxSeconds: longRest, numOfSections: numOfSection)
            taskManager.resetTimer()
        })
        
        .onChange(of: longRest, perform: { value in
            taskManager.task = Task(workSeconds: work, shortRelaxSeconds: shortRest, longRelaxSeconds: longRest, numOfSections: numOfSection)
            taskManager.resetTimer()
        })
        .onChange(of: numOfSection, perform: { value in
            taskManager.task = Task(workSeconds: work, shortRelaxSeconds: shortRest, longRelaxSeconds: longRest, numOfSections: numOfSection)
            taskManager.resetTimer()
        })
    }
}

// MARK: - Preview
struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        TimerMainView(taskManager: TaskManager())
    }
}
