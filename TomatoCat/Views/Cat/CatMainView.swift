//
//  CatMainView.swift
//  TomatoCat
//
//  Created by Shengyuan Lu on 2/26/21.
//

import SwiftUI

struct CatMainView: View {
    var body: some View {
        
        NavigationView {
            ScrollView {
                
                Text("Cat goes here")
                
            }
            .navigationBarTitle(Text("PomodoroCat"))
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct CatMainView_Previews: PreviewProvider {
    static var previews: some View {
        CatMainView()
    }
}
