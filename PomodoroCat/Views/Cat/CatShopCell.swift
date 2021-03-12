import SwiftUI

struct CatShopCell: View {
    
    // MARK: - Variable
    @State var catItem:CatItem
    
    @State var showingSuccessAlert = false
    
    @State var showingFailedAlert = false
    
    @ObservedObject var taskManager:TaskManager
    
    @ObservedObject var catManager:CatManager
    
    @State var audioPlayer = AudioPlayer()
    
    // MARK: - Body
    var body: some View {
        
        ZStack {
            
            HStack(spacing: 15) {
                
                VStack {
                    Image(catItem.imageName)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 80)
                        .padding(.top, 15)
                    
                    Spacer()
                }

                
                VStack(alignment: .leading) {
                    
                    VStack(alignment: .leading, spacing: 3) {
                        Text(catItem.name)
                            .font(.title2)
                            .fontWeight(.bold)
                        
                        
                        Text("\(catItem.description)")
                            .font(.body)
                            .fontWeight(.regular)
                            .fixedSize(horizontal: false, vertical: true)
                            .lineLimit(nil)
                        
                        
                    }
                    .alert(isPresented: $showingSuccessAlert) {
                        Alert(title: Text("Purchase Succeed"), message: Text("You just purchased a \(catItem.name) for C\(catItem.price)"), dismissButton: .default(Text("Got it")))
                    }
                    
                    Spacer()
                    
                    HStack() {
                        
                        Text("Happiness \n+ \(catItem.happinessNum)")
                            .lineLimit(2)
                            .font(.body)
                            .fixedSize(horizontal: false, vertical: true)
                            .lineLimit(nil)
                            .minimumScaleFactor(0.1)
                            
                        
                        Spacer()
                        
                        Button(action: {
                            checkAlertAndBuy()
                        }, label: {
                            Text((catItem.purchased) ? "Purchased" : "Buy C \(catItem.price)")
                                .fontWeight(.bold)
                                .font(.body)
                                .padding(.vertical, 10)
                                .padding(.horizontal, 10)
                                .background((catItem.purchased) ? Color.gray : Color.green)
                                .cornerRadius(10)
                                .foregroundColor(.white)
                            
                        })
                        .layoutPriority(1)
                        .disabled((catItem.purchased) ? true : false)
                        .alert(isPresented: $showingFailedAlert) {
                            Alert(title: Text("Purchase Failed"), message: Text("You don't have enough Cat Coin"), dismissButton: .default(Text("Got it")))
                        }
                    }
                }
            }
        }
        .padding()
        .overlay(
            RoundedRectangle(cornerRadius: 20)
                .stroke(Color.pink, lineWidth: 5)
        )
        .frame(height: 200)
        
    }
    
    // MARK: - Function
    func checkAlertAndBuy() {
        if !catItem.purchased && taskManager.catCoin >= catItem.price{
            showingSuccessAlert.toggle()
            
            catItem.purchased = true
            catManager.catItemArray[catItem.index].purchased = true
            
            catManager.happiness += catItem.happinessNum
            
            taskManager.catCoin -= catItem.price
            
            audioPlayer.startPlayBack(audioUrl: AudioURL.buy!)
        } else {
            showingFailedAlert.toggle()
            audioPlayer.startPlayBack(audioUrl: AudioURL.buyFail!)
        }
    }
    
}

// MARK: - Preview
struct CatShopCell_Previews: PreviewProvider {
    static var previews: some View {
        CatShopCell(catItem: CatManager().catItemArray[0], taskManager: TaskManager(), catManager: CatManager())
    }
}
