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
    var sets: Int {
        switch targetMuscle {
        case "back","chest":
            return 3
        case "biceps","triceps","shoulders":
            return 3
        case "abs","legs":
            return 4
        default:
            return 3
        }
    }
    var reps: Int {
        switch targetMuscle {
        case "back","chest":
            return 12
        case "biceps","triceps","shoulders":
            return 10
        case "abs","legs":
            return 15
        default:
            return 10
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
