//
//  CartViewCell.swift
//  PomodoroCat
//
//  Created by Shengyuan Lu on 2/27/21.
//

import SwiftUI

struct CartViewCell: View {
    
    // MARK: - Variable
    let purchaseItem:PurchaseItem
    
    // MARK: - Body
    var body: some View {
        
        
        ZStack {
            
            VStack(alignment:.leading) {
                
                VStack(alignment: .leading, spacing: 3) {
                    Text(purchaseItem.name)
                        .font(.title2)
                        .fontWeight(.bold)
                    
                    
                    Text(purchaseItem.description)
                        .font(.body)
                        .fontWeight(.regular)
                }
                
                Spacer()
                
                HStack() {
                    
                    Spacer()
                    
                    Button(action: {
                        
                    }, label: {
                        Text("Buy $\(purchaseItem.price)")
                            .fontWeight(.bold)
                            .font(.body)
                            .padding(.vertical, 10)
                            .padding(.horizontal, 10)
                            .background(Color.green)
                            .cornerRadius(10)
                            .foregroundColor(.white)
 
                    })
                    
                }
                
            }
            
            
        }
        .padding()
        .overlay(
            RoundedRectangle(cornerRadius: 20)
                .stroke(Color.pink, lineWidth: 5)
        )
        .frame(height: 150)
        
        
    }
}

// MARK: - Preview
struct CartViewCell_Previews: PreviewProvider {
    static var previews: some View {
        CartViewCell(purchaseItem: purchaseItemArray[0])
    }
}
