import Foundation
import SwiftUI

struct CatItem: Hashable {
    
    let name:String
    
    let imageName:String
    
    let description:String
    
    let price:Int
    
    let happinessNum:Int
    
    let offset:[Float]
    
    var purchased = false
    
    let id = UUID()
    
    init(name:String, imageName:String, description: String, price: Int, happinessNum: Int, offset:[Float]) {
        self.name = name
        self.imageName = imageName
        self.description = description
        self.price = price
        self.happinessNum = happinessNum
        self.offset = offset
    }
}

let catItemArray = [
    CatItem(name: "Wood Clock", imageName: "clock", description: "A classic-looking clock that can tell time, and set alarm.", price: 500, happinessNum: 50, offset: [129.3, -216]),
    CatItem(name: "Bouncy Ball", imageName: "ball1", description: "A classic-looking clock that can tell time, and set alarm.", price: 100, happinessNum: 20, offset: [-100, 210]),
    CatItem(name: "Dreamy Pillow", imageName: "pillow", description: "A pillow made from the feather of the Swift logo bird.", price: 800, happinessNum: 30, offset: [144, -20])
]
