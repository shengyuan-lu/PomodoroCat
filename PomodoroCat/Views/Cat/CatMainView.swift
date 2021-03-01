import SwiftUI

struct CatMainView: View {
    
    @AppStorage("catCoin") private var catCoin = 0
    
    @State private var offset = CGSize(width: 96, height: 163)
    
    @State var audioPlayer = AudioPlayer()
    
    @ObservedObject var catManager:CatManager
    
    var body: some View {
        
        GeometryReader { geometry in
            ZStack {
                Image("catbg")
                    .resizable()
                    .aspectRatio(geometry.size, contentMode: .fill)
                    .edgesIgnoringSafeArea(.all)
                
                
                ForEach(self.catManager.catItemArray, id: \.self) { catItem in
                    
                    if catItem.purchased {
                        Image(catItem.imageName)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 100)
                            .offset(CGSize(width: Double(catItem.offset[0]) , height: Double(catItem.offset[1])))
                    }

                }
                
                Image("cat")
                    .resizable()
                    .scaledToFit()
                    .offset(offset)
                    .frame(width: 150)
                    .gesture(
                        DragGesture()
                            .onChanged { gesture in
                                self.offset = gesture.translation
                            }
                            .onEnded({ (gesture) in
                                audioPlayer.startPlayBack(audioUrl: AudioURL.catSound!)
                                print("Cat location \(gesture.translation)")
                            })
                        
                    )
                
                VStack {
                    Text("Happiness: \(catManager.happiness) / 100")
                        .font(.title)
                        .fontWeight(.bold)
                        .padding()
                        .foregroundColor(Color.black)
                    
                    Spacer()
                }
                
            }
        }
        
    }
}

struct CatMainView_Previews: PreviewProvider {
    static var previews: some View {
        CatMainView(catManager: CatManager())
    }
}
