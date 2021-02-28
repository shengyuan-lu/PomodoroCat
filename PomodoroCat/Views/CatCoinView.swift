//
//  TimerTitleView.swift
//  PomodoroCat
//
//  Created by Shengyuan Lu on 2/27/21.
//

import SwiftUI

struct CatCoinView: View {
    // MARK: - Variable
    @ObservedObject var taskManager:TaskManager
    
    @AppStorage("catCoin") private var catCoin = 0
    
    @Binding var selectionIndex:Int
    
    let cornerRadius:CGFloat = 10
    
    // MARK: - View
    var body: some View {
        
        ZStack {
            
            RoundedRectangle(cornerRadius: cornerRadius).strokeBorder(Color.yellow, lineWidth: 5)
            
            HStack {
                
                // Title
                HStack {
                    
                    Image("currency-dollar-circle")
                        .resizable()
                        .scaledToFit()
                        .foregroundColor(Color.yellow)
                        .padding(.vertical, 15)
                    
                    Text("Cat Coin:")
                        .font(.body)
                        .fontWeight(.bold)
                        .foregroundColor(Color.yellow)
                        
                }
                .padding(.leading, 12)
                
                Spacer()
                
                // Number
                Text("\(catCoin)")
                    .font(.body)
                    .fontWeight(.bold)
                    .foregroundColor(Color.primary)
                    .padding(.trailing, (selectionIndex == 0) ? 0 : 12)
                
                
                // Boost Lable
                
                if selectionIndex == 0 {
                    ZStack {
                        RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/)
                            .foregroundColor((taskManager.multiplierInfo[0] as! Bool) ? Color.yellow : Color.gray)
                        
                        Text((taskManager.multiplierInfo[0] as! Bool) ? "Boost Active \(taskManager.multiplierInfo[1] as! Int)X" : "No Boost" )
                            .fontWeight(.bold)
                            .foregroundColor((taskManager.multiplierInfo[0] as! Bool)
                                                ? Color.black : Color.white)
                    }
                    .frame(width: (taskManager.multiplierInfo[0] as! Bool) ? 160 : 100, height: 30)
                    .padding(.trailing, 10)
                }
            }
        }
        .frame(height: 50)
    }
}

// MARK: - Preview
struct CatCoinView_Previews: PreviewProvider {
    static var previews: some View {
        CatCoinView(taskManager: TaskManager(), selectionIndex: Binding.constant(0))
            .previewLayout(.fixed(width: 375, height: 50))
    }
}
