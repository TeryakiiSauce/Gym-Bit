import Foundation


struct Schedule: Codable, Equatable, Comparable {
    
    var id = UUID()
    let dateCreated: Date
    var name: String
    var playsCounter: Int?
    var exercises: [Exercise]
    
    // Creating the directory and filename
    static let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
    static let archiveURL =     documentsDirectory.appendingPathComponent("Schedule").appendingPathExtension("exerciseList")
    
    // Method that saves the schedules
    static func saveSchedules(_ Schedule: [Schedule]) {
        //creating an encoder
        let propertyListEncoder = PropertyListEncoder()
        //encoding the schedule
        let codedSchedules = try? propertyListEncoder.encode(Schedule)
        //writing the encoded sehedule to the file
        try? codedSchedules?.write(to: archiveURL, options: .noFileProtection)
    }
    
    static func ==(lhs: Schedule, rhs: Schedule) -> Bool {
        return lhs.id == rhs.id && lhs.dateCreated == rhs.dateCreated && lhs.name == rhs.name && lhs.playsCounter == rhs.playsCounter
    }
    
    // Used for sorting the schedules depending on the method selected by the user
    static func < (lhs: Schedule, rhs: Schedule) -> Bool {
        if DefaultData.currSelectedSortOption == "alphabetical" {
            return lhs.name.lowercased() < rhs.name.lowercased()
        } else if DefaultData.currSelectedSortOption == "timesUsed" {
            return lhs.playsCounter! < lhs.playsCounter!
        } else if DefaultData.currSelectedSortOption == "dateCreated" {
            return lhs.dateCreated < lhs.dateCreated
        } else {
            return false
        }
    }
}

