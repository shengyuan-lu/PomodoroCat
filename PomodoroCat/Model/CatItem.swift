import Foundation
import SwiftUI

struct CatItem: Hashable {
    
    let name: String
    let imageName: String
    let description: String
    let price: Int
    let happinessNum: Int
    let offset: [Float]
    var purchased = false
    let id = UUID()
    let index: Int
    
    init(name: String, imageName: String, description: String, price: Int, happinessNum: Int, offset: [Float], index: Int, purchased: Bool) {
        self.name = name
        self.imageName = imageName
        self.description = description
        self.price = price
        self.happinessNum = happinessNum
        self.offset = offset
        self.index = index
        self.purchased = purchased
    }
}


