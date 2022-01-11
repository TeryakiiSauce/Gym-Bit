import Foundation


struct Schedule: Codable, Equatable, Comparable {
    
    var id = UUID()
    let dateCreated: Date
    var name: String
    var playsCounter: Int?
    var exercises: [Exercise]
    
    // Creating the directory and filename
    static let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
    static let scheduleArrArchiveURL = documentsDirectory.appendingPathComponent("schedulesData").appendingPathExtension("plist")
    static let activatedScheduleArchiveURL = documentsDirectory.appendingPathComponent("activatedSchedule").appendingPathExtension("plist")
    
    // Encodes & saves the schedules as "schedulesData.plist" in the App's Sandbox
    static func saveSchedules(_ schedules: [Schedule]) {
        let propertyListEncoder = PropertyListEncoder()
        let encodedSchedulesData = try? propertyListEncoder.encode(schedules)
        try? encodedSchedulesData?.write(to: scheduleArrArchiveURL, options: .noFileProtection)
    }
    
    // Decodes, reads & returns the array of schedules
    static func getSchedules() -> [Schedule] {
        let propertyListDecoder = PropertyListDecoder()
        if let retrievedSchedulesData = try? Data(contentsOf: scheduleArrArchiveURL), let decodedSchedulesData = try? propertyListDecoder.decode(Array<Schedule>.self, from: retrievedSchedulesData) {
            return decodedSchedulesData
        }
        
        return []
    }
    
    // Encodes & saves activated schedule in local storage
    static func saveActivatedSchedule(_ schedule: Schedule) {
        let propertyListEncoder = PropertyListEncoder()
        let encodedSchedule = try? propertyListEncoder.encode(schedule)
        try? encodedSchedule?.write(to: activatedScheduleArchiveURL, options: .noFileProtection)
    }
    
    // Decodes, reads & returns the activated schedule
    static func getActivatedSchedule() -> Schedule {
        let propertyListDecoder = PropertyListDecoder()
        if let retrievedSchedule = try? Data(contentsOf: activatedScheduleArchiveURL), let decodedSchedule = try? propertyListDecoder.decode(Schedule.self, from: retrievedSchedule) {
            return decodedSchedule
        }
        
        return Schedule(dateCreated: Date(), name: "", playsCounter: nil, exercises: [])
    }
    
    static func ==(lhs: Schedule, rhs: Schedule) -> Bool {
        return lhs.id == rhs.id && lhs.dateCreated == rhs.dateCreated && lhs.name == rhs.name && lhs.playsCounter == rhs.playsCounter
    }
    
    // Used for sorting the schedules depending on the method selected by the user
    static func < (lhs: Schedule, rhs: Schedule) -> Bool {
        if DefaultData.currSelectedSortOption == "alphabetical" {
            return lhs.name.lowercased() < rhs.name.lowercased()
        } else if DefaultData.currSelectedSortOption == "timesUsed" {
            return lhs.playsCounter! < rhs.playsCounter!
        } else if DefaultData.currSelectedSortOption == "dateCreated" {
            return lhs.dateCreated < rhs.dateCreated
        } else {
            return false
        }
    }
}

