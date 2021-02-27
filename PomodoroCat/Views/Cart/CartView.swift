//
//  CartView.swift
//  PomodoroCat
//
//  Created by Shengyuan Lu on 2/27/21.
//

import SwiftUI

struct CartView: View {
    
    // MARK: - Variable
    
    // MARK: - Body
    var body: some View {
        
        
        ScrollView {
            ForEach(purchaseItemArray, id: \.self) { purchaseItem in
                CartViewCell(purchaseItem: purchaseItem)
                    .padding(.horizontal, 20)
                    .padding(.top, 20)
            }
            
        }
        
    }
}

// MARK: - Preview
struct CartView_Previews: PreviewProvider {
    static var previews: some View {
        CartView()
    }
}
