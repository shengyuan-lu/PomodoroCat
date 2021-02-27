//
//  GeniusView.swift
//  PomodoroCat
//
//  Created by Shengyuan Lu on 2/27/21.
//

import SwiftUI

struct GeniusView: View {
    // MARK: - Variable
    @Environment(\.presentationMode) var presentationMode
    
    // MARK: - View
    var body: some View {
        
        ScrollView {
            ForEach(geniusArray, id: \.self) { genius in
                ProfileView(genius: genius)
                    .padding()
            }
        }
        .statusBar(hidden: true)
        .navigationBarTitle("Genius", displayMode: .inline)
        // Hide the system back button
        .navigationBarBackButtonHidden(true)
        // Add your custom back button here
        .navigationBarItems(leading:
                                Button(action: {
                                    self.presentationMode.wrappedValue.dismiss()
                                }) {
                                    HStack {
                                        Image(systemName: "arrow.left.circle.fill")
                                        Text("Back")
                                    }
                                })
    }
}

// MARK: - Preview
struct GeniusView_Previews: PreviewProvider {
    static var previews: some View {
        GeniusView()
    }
}
