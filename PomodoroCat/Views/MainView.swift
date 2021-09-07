import SwiftUI

struct MainView: View {
    
    // MARK: - Variable
    @State private var showIAPCartModal = false
    @State private var showCatCartModal = false
    
    @AppStorage("themeIndex") var themeIndex = 1
    
    @AppStorage("work") private var work = 25
    @AppStorage("shortRest") private var shortRest = 5
    @AppStorage("longRest") private var longRest = 15
    @AppStorage("numOfSection") private var numOfSection = 4
    @AppStorage("catCoin") private var catCoin = 0
    
    @StateObject var taskManager: TaskManager = TaskManager()
    
    @StateObject var catManager: CatManager = CatManager()
    
    @State private var selectionIndex = 0
    
    // MARK: - View
    var body: some View {
        
        NavigationView {
            
            VStack {
                CatCoinView(taskManager: taskManager, selectionIndex: $selectionIndex)
                    .padding(.horizontal, 20)
                    .padding(.top, 10)
                
                TabView(selection: $selectionIndex) {
                    TimerMainView(taskManager: taskManager)
                        .padding(.top, 5)
                        .tag(0)
                    
                    CatMainView(catManager: catManager)
                        .tag(1)
                    
                }
                .tabViewStyle(PageTabViewStyle())
                .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))
                .navigationBarTitle(Text("PomodoroCat"))
                .navigationBarTitleDisplayMode(.inline)
                .navigationBarItems(
                    leading:
                        Button(action: {
                            if selectionIndex == 0 {
                                showIAPCartModal.toggle()
                            } else if selectionIndex == 1 {
                                showCatCartModal.toggle()
                            }
                        }, label: {
                            Image(systemName: "cart.fill")
                                .font(.title2)
                        })
                        .sheet(isPresented: self.$showIAPCartModal, content: {
                            NavigationView {
                                ShopView(taskManager: taskManager)
                                    .preferredColorScheme(determineTheme(themeIndex))
                                    .navigationBarTitle(Text("Purchase Booster"))
                                    .navigationBarTitleDisplayMode(.inline)
                            }
                        }),
                    trailing:
                        NavigationLink(
                            destination: SettingsView(taskManager: taskManager),
                            label: {
                                Image(systemName: "gearshape.fill")
                                    .font(.title2)
                            }))
                .sheet(isPresented: self.$showCatCartModal, content: {
                    NavigationView {
                        CatShopView(catManager: catManager, taskManager: taskManager)
                            .preferredColorScheme(determineTheme(themeIndex))
                            .navigationBarTitle(Text("Cat Items"))
                            .navigationBarTitleDisplayMode(.inline)
                    }
                })
                .onChange(of: selectionIndex, perform: { value in
                    self.taskManager.resetTimer()
                })
            }
        }
        .onAppear(perform: {
            taskManager.task = Task(workSeconds: work, shortRelaxSeconds: shortRest, longRelaxSeconds: longRest, numOfSections: numOfSection)
            taskManager.currentMinute = taskManager.task.workSeconds
            
            taskManager.catCoin = catCoin
        })
        .onChange(of: taskManager.catCoin, perform: { value in
            self.catCoin = taskManager.catCoin
        })
    }
}

// MARK: - Preview
struct TabView_Previews: PreviewProvider {
    static var previews: some View {
        MainView(taskManager: TaskManager())
    }
}
