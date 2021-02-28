import Foundation

struct CatItem: Hashable {
    
    let name:String
    
    let description:String
    
    let price:Int
    
    let happinessNum:Int
    
    
    
    let id = UUID()
    
    init(name:String, description: String, price: Int, happinessNum: Int) {
        self.name = name
        self.description = description
        self.price = price
        self.happinessNum = happinessNum
    }
}

let catItemArray = [
    1
]
