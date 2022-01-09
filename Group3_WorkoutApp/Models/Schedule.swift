import Foundation


struct Schedule: Codable, Equatable, Comparable {
    
    var id = UUID()
    var name: String
    let dateCreated: Date
    var playsCounter: Int?
    var exercises: [Exercise]
    
    // Creating the directory and filename
    static let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
    static let archiveURL = documentsDirectory.appendingPathComponent("schedulesData").appendingPathExtension("plist")
    
    // Encodes & saves the schedules as "schedulesData.plist" in the App's Sandbox
    static func saveSchedules(_ schedules: [Schedule]) {
        let propertyListEncoder = PropertyListEncoder()
        let encodedSchedulesData = try? propertyListEncoder.encode(schedules)
        try? encodedSchedulesData?.write(to: archiveURL, options: .noFileProtection)
    }
    
    // Decodes, reads & returns the array of schedules
    static func getSchedules() -> [Schedule] {
        let propertyListDecoder = PropertyListDecoder()
        if let retrievedSchedulesData = try? Data(contentsOf: archiveURL), let decodedSchedulesData = try? propertyListDecoder.decode(Array<Schedule>.self, from: retrievedSchedulesData) {
            return decodedSchedulesData
        }
        
        return []
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

