import Foundation

struct PurchaseItem: Hashable {
    
    let name: String
    let description: String
    let booster: Int
    let price: String
    let id = UUID()
    
    init(name: String, description: String, booster: Int, price: String) {
        self.name = name
        self.booster = booster
        self.price = price
        self.description = description
    }
    
}

let purchaseItemArray = [
    PurchaseItem(name: "2X Cat Coin Booster", description: "Get double cat coins in your next session. Single Use. Can't be combined.", booster: 2, price: "1.99"),
    PurchaseItem(name: "10X Cat Coin Booster", description: "Get 10X more cat coins in your next session. Single Use. Can't be combined.", booster: 10, price: "3.99")
]
