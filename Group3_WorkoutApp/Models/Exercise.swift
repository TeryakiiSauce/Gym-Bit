//
//  Exercise.swift
//  Group3_WorkoutApp
//
//  Created by Ali Alqallaf on 13/12/2021.
//

import Foundation

struct Exercise: Codable {
    
    var id = UUID()
    let name: String
    let description: String
    let imagePath: String
    let tips: [String]
    let targetMuscle: String
    var reps: String {
        switch targetMuscle {
        case "back","chest":
            return "12 reps x 3 sets"
        case "biceps","triceps","shoulders":
            return "10 reps x 3 sets"
        case "abs","legs":
            return "15 reps x 4 sets"
        default:
            return "10 reps x 3 sets"
        }
    }
    
    enum TargetMuscle: String {
        case back = "back"
        case chest = "chest"
        case biceps = "biceps"
        case triceps = "triceps"
        case abs = "abs"
        case shoulders = "shoulders"
        case legs = "legs"
    }
}
