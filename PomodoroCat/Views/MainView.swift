//
//  TabView.swift
//  TomatoCat
//
//  Created by Shengyuan Lu on 2/26/21.
//

import SwiftUI

struct MainView: View {
    
    // MARK: - Variable
    @State private var showCatModal = false
    
    // MARK: - View
    var body: some View {
        
        NavigationView {
            TimerMainView()
                .navigationBarTitle(Text("PomodoroCat"))
                .navigationBarTitleDisplayMode(.inline)
                .navigationBarItems(
                    leading:
                        NavigationLink(
                            destination: SettingsView(),
                            label: {
                                Image(systemName: "gearshape.fill")
                                    .font(.title2)
                            }),
                    
                    trailing:
                        Button(action: {
                            
                        }, label: {
                            Image(systemName: "cart.fill")
                                .font(.title2)
                        }).sheet(isPresented: self.$showCatModal, content: {
                            
                        }))
        }
        
        
    }
    
}

struct TabView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
