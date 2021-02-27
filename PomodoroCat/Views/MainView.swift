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
        LoginMainView()
    }
    
}

// MARK: - Preview
struct TabView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
