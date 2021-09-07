import Foundation
import SwiftUI

class CatManager: ObservableObject {
    
    @Published var happiness: Int = 0
    
    @Published var catItemArray = [
        CatItem(name: "Wood Clock", imageName: "clock", description: "A classic-looking clock that can tell time, and set alarm.", price: 500, happinessNum: 50, offset: [130, -190], index: 0, purchased: false),
        CatItem(name: "Bouncy Ball", imageName: "ball1", description: "A classic-looking clock that can tell time, and set alarm.", price: 100, happinessNum: 20, offset: [-100, 210], index: 1, purchased: false),
        CatItem(name: "Dreamy Pillow", imageName: "pillow", description: "A pillow made from the feather of the Swift bird.", price: 800, happinessNum: 30, offset: [144, 20], index: 2, purchased: false),
//        CatItem(name: "Soft Bed", imageName: "bed", description: "A bed made from cotton and wood.", price: 800, happinessNum: 50, offset: [126, 214], index: 2, purchased: false),
//        CatItem(name: "Rubber ball", imageName: "ball2", description: "A yellow rubber ball that your cat might like.", price: 40, happinessNum: 5, offset: [-72, 39], index: 2, purchased: false),
//        CatItem(name: "Table", imageName: "table", description: "A Japanese style wooden table with flowers on it.", price: 200, happinessNum: 30, offset: [144, -20], index: 2, purchased: false)
    ]
    
}
