//
//  CatShopView.swift
//  PomodoroCat
//
//  Created by Shengyuan Lu on 2/28/21.
//

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
            ForEach(catItemArray, id: \.self) { catItem in
                CatShopCell(catItem: catItem, catManager: catManager, taskManager: taskManager)
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
struct CatShopView_Previews: PreviewProvider {
    static var previews: some View {
        CatShopView(catManager: CatManager(), taskManager: TaskManager())
    }
}
