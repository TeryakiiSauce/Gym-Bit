//
//  DefaultData.swift
//  Group3_WorkoutApp
//
//  Created by Ali Alqallaf on 01/01/2022.
//

import Foundation

struct DefaultData {
    
    static var user = User(dateJoined: Date(), fullName: "Mike Gonzalis", height: 177, weight: 68, goalWeight: 70, dailyWorkoutMinutes: nil, dailyCardioMinutes: nil, avgWeeklyWorkoutMinutes: nil, avgWeeklyCardioMinutes: nil, totalyWorkoutMinutes: nil, totalCardioMinutes: nil, totalWorkedoutDays: nil, workoutStreak: nil, schedules: nil, activeSchedule: nil)
    
    static var exercises =
        [
            Exercise(name: "Chest bench Press", description: "description", imagePath: "chest1", tips: ["tip1","tip2"], targetMuscle: Exercise.TargetMuscle.chest.rawValue),
            Exercise(name: "Shoulder Press", description: "description", imagePath: "shoulder1", tips: ["tip1","tip2"], targetMuscle: Exercise.TargetMuscle.shoulders.rawValue),
            Exercise(name: "Leg Press", description: "description", imagePath: "legs1", tips: ["tip1","tip2"], targetMuscle: Exercise.TargetMuscle.legs.rawValue),
            Exercise(name: "Crunches", description: "description", imagePath: "abs1", tips: ["tip1","tip2"], targetMuscle: Exercise.TargetMuscle.abs.rawValue),
            Exercise(name: "Curls", description: "description", imagePath: "bi2", tips: ["tip1","tip2"], targetMuscle: Exercise.TargetMuscle.biceps.rawValue),
            Exercise(name: "Rope", description: "description", imagePath: "tri1", tips: ["tip1","tip2"], targetMuscle: Exercise.TargetMuscle.triceps.rawValue),
            Exercise(name: "Pull down", description: "description", imagePath: "back2", tips: ["tip1","tip2"], targetMuscle: Exercise.TargetMuscle.back.rawValue)
        ]
    
    static var schedules =
        Schedule(dateCreated: Date(), name: "Full Body Workout", playsCounter: 0, exercises: exercises)
    
}
