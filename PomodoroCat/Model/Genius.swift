import Foundation

struct Genius:Hashable {
    
    let name:String
    
    let imageName:String
    
    let role:String
    
    let bio:String
    
    let id = UUID()
    
    init(name:String, imageName:String, role:String, bio:String) {
        self.name = name
        self.imageName = imageName
        self.role = role
        self.bio = bio
    }
}

let geniusArray = [
    Genius(name: "Shengyuan Lu", imageName: "shengyuan", role: "Frontend Engineer", bio: "Computer Science 2024\nUniversity of California, Irinve"),
    Genius(name: "Yinghao Liu", imageName: "yinghao", role: "Backend Engineer", bio: "Computer Science Enginnering 2024\nUniversity of California, Irinve"),
    Genius(name: "Jingqi Yao", imageName: "jingqi", role: "Backend Engineer", bio: "Computer Science 2023\nUniversity of California, Irinve"),
    Genius(name: "Qingshuang Su", imageName: "qingshuang", role: "Backend Engineer", bio: "Computer Science Enginnering 2024\nUniversity of California, Irinve")
]
