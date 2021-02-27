//
//  TabView.swift
//  TomatoCat
//
//  Created by Shengyuan Lu on 2/26/21.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        
        TabView {
            TimerMainView()
                .tabItem {
                    Label("Pomodoro", systemImage: "timer")
                }
                .tag(1)
            
            CatMainView()
                .tabItem {
                    Label("Cat", systemImage: "hare.fill")
                }
                .tag(2)
            
        }
        
    }
}

struct TabView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
