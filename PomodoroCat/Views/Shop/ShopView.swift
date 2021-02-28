import SwiftUI

struct ShopView: View {
    
    // MARK: - Variable
    @Environment(\.presentationMode) var presentationMode
    
    @ObservedObject var taskManager:TaskManager
    
    // MARK: - Body
    var body: some View {
        
        
        ScrollView {
            ForEach(purchaseItemArray, id: \.self) { purchaseItem in
                ShopItemCell(purchaseItem: purchaseItem, taskManager: taskManager)
                    .padding(.horizontal, 20)
                    .padding(.top, 20)
            }
            
        }
        
    }
}

// MARK: - Preview
struct CartView_Previews: PreviewProvider {
    static var previews: some View {
        ShopView(taskManager: TaskManager())
    }
}
