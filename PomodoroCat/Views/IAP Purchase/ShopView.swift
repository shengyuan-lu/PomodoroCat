import SwiftUI

struct ShopView: View {
    
    // MARK: - Variable
    @ObservedObject var taskManager: TaskManager
    
    @Environment(\.presentationMode) var presentationMode
    
    @State var audioPlayer = AudioPlayer()
    
    // MARK: - Body
    var body: some View {
        
        ScrollView {
            ForEach(purchaseItemArray, id: \.self) { purchaseItem in
                ShopItemCell(purchaseItem: purchaseItem, taskManager: taskManager)
                    .padding(.horizontal, 20)
                    .padding(.top, 20)
            }
            
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
struct CartView_Previews: PreviewProvider {
    static var previews: some View {
        ShopView(taskManager: TaskManager())
    }
}
