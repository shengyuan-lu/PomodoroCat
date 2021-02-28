//
//  CatMainView.swift
//  TomatoCat
//
//  Created by Shengyuan Lu on 2/26/21.
//

import SwiftUI

struct CatMainView: View {
    
    @AppStorage("catCoin") private var catCoin = 0
    
    var body: some View {
        
        Text("Cat goes here")
        
    }
}

struct CatMainView_Previews: PreviewProvider {
    static var previews: some View {
        CatMainView()
    }
}
