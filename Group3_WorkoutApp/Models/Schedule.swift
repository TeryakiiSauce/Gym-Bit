import Foundation


struct Schedule {
    
    let id = UUID()
    let dateCreated: Date?
    var name: String?
    var playsCounter: Int?
    var exercises: [Exercise]
    
    
    
}
