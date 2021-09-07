import SwiftUI

struct ShopItemCell: View {
    
    // MARK: - Variable
    let purchaseItem: PurchaseItem
    
    @State private var showingSuccessAlert = false
    
    @State private var showingFailedAlert = false
    
    @ObservedObject var taskManager: TaskManager
    
    @State var audioPlayer = AudioPlayer()
    
    // MARK: - Body
    var body: some View {
        
        ZStack {
            
            VStack(alignment:.leading) {
                
                VStack(alignment: .leading, spacing: 3) {
                    Text(purchaseItem.name)
                        .font(.title2)
                        .fontWeight(.bold)
                    
                    
                    Text(purchaseItem.description)
                        .font(.body)
                        .fontWeight(.regular)
                        .fixedSize(horizontal: false, vertical: true)
                        .lineLimit(nil)
                }
                .alert(isPresented: $showingSuccessAlert) {
                    Alert(title: Text("Purchase Succeed"), message: Text("You just purchased a \(purchaseItem.booster)X booster for $\(purchaseItem.price)"), dismissButton: .default(Text("Got it")))
                }
                
                Spacer()
                
                HStack() {
                    
                    Spacer()
                    
                    Button(action: {
                        checkAlertAndBuy()
                        
                    }, label: {
                        Text("Buy $\(purchaseItem.price)")
                            .fontWeight(.bold)
                            .font(.body)
                            .padding(.vertical, 10)
                            .padding(.horizontal, 10)
                            .background(Color.green)
                            .cornerRadius(10)
                            .foregroundColor(.white)
                        
                    })
                    .alert(isPresented: $showingFailedAlert) {
                        Alert(title: Text("Purchase Failed"), message: Text("There is already a booster active"), dismissButton: .default(Text("Got it")))
                    }
                }
            }
        }
        .padding()
        .overlay(
            RoundedRectangle(cornerRadius: 20)
                .stroke(Color.yellow, lineWidth: 5)
        )
        .frame(height: 160)

    }
    
    // MARK: - Function
    func checkAlertAndBuy() {
        if taskManager.multiplierInfo[0] as! Bool == true {
            audioPlayer.startPlayBack(audioUrl: AudioURL.buyFail!)
            showingFailedAlert = true
        } else if taskManager.multiplierInfo[0] as! Bool == false {
            audioPlayer.startPlayBack(audioUrl: AudioURL.buy!)
            showingSuccessAlert = true
            taskManager.multiplierInfo = [true, purchaseItem.booster]
        }
    }
}

// MARK: - Preview
struct CartViewCell_Previews: PreviewProvider {
    static var previews: some View {
        ShopItemCell(purchaseItem: purchaseItemArray[0], taskManager: TaskManager())
    }
}
