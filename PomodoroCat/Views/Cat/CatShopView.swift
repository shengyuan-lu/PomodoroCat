import SwiftUI

struct CatShopView: View {
    
    // MARK: - Variable
    @ObservedObject var catManager:CatManager
    
    @ObservedObject var taskManager:TaskManager
    
    @Environment(\.presentationMode) var presentationMode
    
    @State var audioPlayer = AudioPlayer()
    
    // MARK: - Body
    var body: some View {
        
        ScrollView {
            LazyVStack(alignment: .leading, spacing: 30) {
                ForEach(catManager.catItemArray, id: \.self) { catItem in
                    CatShopCell(catItem: catItem, taskManager: taskManager, catManager: catManager)
                        .padding(.horizontal, 20)
                }
            }
            .padding(.top, 20)
            
        }
        .navigationBarItems(
            trailing:
                Button(action: {
                    closeButtonTapped()
                }, label: {
                    Image(systemName: "xmark.circle.fill")
                        .font(.title)
                        .foregroundColor(.tomato)
                }))
        
    }
    
    // MARK: - Functions
    func closeButtonTapped() {
        self.audioPlayer.startPlayBack(audioUrl: AudioURL.toggleOff!)
        self.presentationMode.wrappedValue.dismiss()
    }
}

// MARK: - Preview
struct CatShopView_Previews: PreviewProvider {
    static var previews: some View {
        CatShopView(catManager: CatManager(), taskManager: TaskManager())
    }
}
