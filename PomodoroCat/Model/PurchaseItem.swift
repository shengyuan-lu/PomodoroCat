import Foundation

struct PurchaseItem:Hashable {
    
    let name:String
    
    let description:String
    
    let multiplier:Int
    
    let price:String
    
    let id = UUID()
    
    init(name:String, description: String, multiplier: Int, price: String) {
        self.name = name
        self.multiplier = multiplier
        self.price = price
        self.description = description
    }
    
}

let purchaseItemArray = [
    PurchaseItem(name: "2X Cat Coin Multiplier", description: "Get more cat coins in one session", multiplier: 2, price: "1.99"),
    PurchaseItem(name: "10X Cat Coin Multiplier", description: "Get even more cat coins in one session", multiplier: 2, price: "3.99")
]
