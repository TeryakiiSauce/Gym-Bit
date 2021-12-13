import Foundation

struct User {
    
//    main user attributes
    let id = UUID()
    let dateJoined: Date
    var fullName: String?
    var height: Int?
    var weight: Int?
    var goalWeight: Int?

    //    daily user stats
    var dailyWorkoutMinutes: Int?
    var dailyCardioMinutes: Int?
    
//    weekly user stats
    var avgWeeklyWorkoutMinutes: Int?
    var avgWeeklyCardioMinutes: Int?
    
//    all time user stats
    var totalyWorkoutMinutes: Int?
    var totalCardioMinutes: Int?
    var totalWorkedoutDays: Int?
    var workoutStreak: Int?
    
}

