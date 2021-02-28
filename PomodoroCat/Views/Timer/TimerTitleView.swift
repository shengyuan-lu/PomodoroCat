//
//  TimerTitleView.swift
//  PomodoroCat
//
//  Created by Shengyuan Lu on 2/27/21.
//

import SwiftUI

struct TimerTitleView: View {
    // MARK: - Variable
    @ObservedObject var taskManager:TaskManager
    
    @AppStorage("catCoin") private var catCoin = 0
    
    // MARK: - View
    var body: some View {
        
        GeometryReader(content: { geometry in
            
            VStack(alignment: .leading) {
                
                Text("Your Progress (\(taskManager.completedSection)/\(taskManager.task.numOfSections))")
                    .font(.body)
                    .fontWeight(.bold)
                    .foregroundColor(Color.primary)
                
                Text("Your CatCoin: \(catCoin)")
                    .font(.body)
                    .fontWeight(.bold)
                    .foregroundColor(Color.primary)
                
                
            }
            .frame(height: 10, alignment: .leading)
            
            
        })
        
    }
}

// MARK: - Preview
struct TimerTitleView_Previews: PreviewProvider {
    static var previews: some View {
        TimerTitleView(taskManager: TaskManager())
            .previewLayout(.fixed(width: 375, height: 150))
            .padding()
    }
}
