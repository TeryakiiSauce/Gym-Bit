//
//  Exercise.swift
//  Group3_WorkoutApp
//
//  Created by Ali Alqallaf on 13/12/2021.
//

import Foundation

struct Exercise: Codable {
    
    let id = UUID()
    let name: String
    let description: String
    let imagePath: String
    let tips: [String]
    let targetMuscle: String
    
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
