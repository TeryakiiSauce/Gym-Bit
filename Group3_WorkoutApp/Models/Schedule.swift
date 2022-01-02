import Foundation


struct Schedule: Codable {
    
    let id = UUID()
    let dateCreated: Date?
    var name: String?
    var playsCounter: Int?
    var exercises: [Exercise]
    
    //creating the directory and filename
    static let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
    static let archiveURL =     documentsDirectory.appendingPathComponent("Schedule").appendingPathExtension("exerciseList")
    
    //method that saves the schedules
    static func saveSchedules(_ Schedule: Schedule) {
        //creating an encoder
        let propertyListEncoder = PropertyListEncoder()
        //encoding the schedule
        let codedSchedules = try? propertyListEncoder.encode(Schedule)
        //writing the encoded sehedule to the file
        try? codedSchedules?.write(to: archiveURL, options: .noFileProtection)
    }
}

