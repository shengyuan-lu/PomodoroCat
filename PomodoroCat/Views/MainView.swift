//
//  TabView.swift
//  TomatoCat
//
//  Created by Shengyuan Lu on 2/26/21.
//

import SwiftUI

struct MainView: View {
    
    // MARK: - Variable
    @State private var showCartModal = false
    
    @AppStorage("themeIndex") private var themeIndex = 1
    
    // MARK: - View
    var body: some View {
        
        NavigationView {
            
            TabView {
                TimerMainView()
                CatMainView()
            }
            .tabViewStyle(PageTabViewStyle())
            .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))
            .navigationBarTitle(Text("PomodoroCat"))
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarItems(
                leading:
                    Button(action: {
                        showCartModal.toggle()
                    }, label: {
                        Image(systemName: "cart.fill")
                            .font(.title2)
                    }).sheet(isPresented: self.$showCartModal, content: {
                        
                        NavigationView {
                            CartView()
                                .preferredColorScheme(determineTheme(themeIndex))
                                .navigationBarTitle(Text("Purchase Multiplier"))
                                .navigationBarTitleDisplayMode(.inline)
                        }

                    })
                ,
                
                trailing:
                    NavigationLink(
                        destination: SettingsView(),
                        label: {
                            Image(systemName: "gearshape.fill")
                                .font(.title2)
                        }))
        }
        
        
    }
    
}

// MARK: - Preview
struct TabView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
