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
    PurchaseItem(name: "2X Cat Coin Multiplier", description: "Get double cat coins in your next session. Single Use.", multiplier: 2, price: "1.99"),
    PurchaseItem(name: "10X Cat Coin Multiplier", description: "Get 10X more cat coins in your next session. Single Use.", multiplier: 10, price: "3.99")
]
