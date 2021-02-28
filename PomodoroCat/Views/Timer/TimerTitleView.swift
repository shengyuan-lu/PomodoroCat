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
    
    // MARK: - View
    var body: some View {
        
        GeometryReader(content: { geometry in
            
            VStack(alignment: .leading) {
                
                Text("Your Progress (\(taskManager.completedSection)/4)")
                    .font(.body)
                    .fontWeight(.regular)
                    .foregroundColor(Color.primary)
                
                HStack {
                    
                }
                
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
