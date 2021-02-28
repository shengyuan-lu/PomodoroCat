//
//  CatMainView.swift
//  TomatoCat
//
//  Created by Shengyuan Lu on 2/26/21.
//

import SwiftUI

struct CatMainView: View {
    
    @AppStorage("catCoin") private var catCoin = 0
    
    @State private var offset = CGSize.zero
    
    var body: some View {
        
        GeometryReader { geometry in
            ZStack {
                Image("catbg")
                    .resizable()
                    .aspectRatio(geometry.size, contentMode: .fill)
                    .edgesIgnoringSafeArea(.all)
                
                Image("cat")
                    .resizable()
                    .scaledToFit()
                    .offset(offset)
                    .frame(width: 200)
                    .gesture(
                        DragGesture()
                            .onChanged { gesture in
                                self.offset = gesture.translation
                            }
                    )
                
            }
        }
        
    }
}

struct CatMainView_Previews: PreviewProvider {
    static var previews: some View {
        CatMainView()
    }
}
