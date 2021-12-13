//
//  Exercise.swift
//  Group3_WorkoutApp
//
//  Created by Ali Alqallaf on 13/12/2021.
//

import Foundation

struct Exercise {
    
    let id = UUID()
    let name: String
    let description: String
    let imagePath: String
    let tips: [String]
    let targetMuscle: TargetMuscle
    
    enum TargetMuscle {
        case back, chest, biceps, triceps, abs, shoulders, legs
    }
}
