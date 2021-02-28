import SwiftUI

struct MainView: View {
    
    // MARK: - Variable
    @State private var showCartModal = false
    
    @AppStorage("themeIndex") var themeIndex = 1
    
    @AppStorage("work") private var work = 25
    @AppStorage("shortRest") private var shortRest = 5
    @AppStorage("longRest") private var longRest = 15
    @AppStorage("numOfSection") private var numOfSection = 4
    
    @AppStorage("catCoin") private var catCoin = 0
    
    @StateObject var taskManager:TaskManager = TaskManager()
    
    // MARK: - View
    var body: some View {
        
        NavigationView {
            
            TabView {
                TimerMainView(taskManager: taskManager)
                CatMainView()
            }
            .tabViewStyle(PageTabViewStyle())
            .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))
            .navigationBarTitle(Text("PomodoroCat"))
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarItems(
                leading:
                    Button(action: {
                        showCartModal.toggle()
                    }, label: {
                        Image(systemName: "cart.fill")
                            .font(.title2)
                    }).sheet(isPresented: self.$showCartModal, content: {
                        
                        NavigationView {
                            ShopView(taskManager: taskManager)
                                .preferredColorScheme(determineTheme(themeIndex))
                                .navigationBarTitle(Text("Purchase Multiplier"))
                                .navigationBarTitleDisplayMode(.inline)
                        }
                        
                    })
                ,
                
                trailing:
                    NavigationLink(
                        destination: SettingsView(taskManager: taskManager),
                        label: {
                            Image(systemName: "gearshape.fill")
                                .font(.title2)
                        }))
        }
        .onAppear(perform: {
            taskManager.task = Task(workSeconds: work, shortRelaxSeconds: shortRest, longRelaxSeconds: longRest, numOfSections: numOfSection)
            taskManager.currentMinute = taskManager.task.workSeconds
            
            taskManager.catCoin = catCoin
        })
        
        
    }
    
}

// MARK: - Preview
struct TabView_Previews: PreviewProvider {
    static var previews: some View {
        MainView(taskManager: TaskManager())
    }
}
