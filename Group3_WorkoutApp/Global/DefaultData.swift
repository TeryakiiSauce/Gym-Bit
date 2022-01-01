//
//  DefaultData.swift
//  Group3_WorkoutApp
//
//  Created by Ali Alqallaf on 01/01/2022.
//

import Foundation

struct DefaultData {
    
    static var user = User(dateJoined: Date(), fullName: "Mike Gonzalis", height: 177, weight: 68, goalWeight: 70, dailyWorkoutMinutes: nil, dailyCardioMinutes: nil, avgWeeklyWorkoutMinutes: nil, avgWeeklyCardioMinutes: nil, totalyWorkoutMinutes: nil, totalCardioMinutes: nil, totalWorkedoutDays: nil, workoutStreak: nil, schedules: schedules, activeSchedule: schedules[0])
    
    static var backExercises =
        [
            
            Exercise(name: "Pull down", description: "description", imagePath: "back2", tips: ["tip1","tip2"], targetMuscle: Exercise.TargetMuscle.back.rawValue)
        ]
    static var chestExercises =
        [
            Exercise(name: "Chest bench Press", description: "description", imagePath: "chest1", tips: ["tip1","tip2"], targetMuscle: Exercise.TargetMuscle.chest.rawValue)
        ]
    static var shoulderExercises =
        [
           
            Exercise(name: "Shoulder Press", description: "description", imagePath: "shoulder1", tips: ["tip1","tip2"], targetMuscle: Exercise.TargetMuscle.shoulders.rawValue)
        ]
    static var legExercises =
        [
            Exercise(name: "Leg Press", description: "description", imagePath: "legs1", tips: ["tip1","tip2"], targetMuscle: Exercise.TargetMuscle.legs.rawValue)
        ]
    static var absExercises =
        [
            
            Exercise(name: "Crunches", description: "description", imagePath: "abs1", tips: ["tip1","tip2"], targetMuscle: Exercise.TargetMuscle.abs.rawValue)
        ]
    static var bicepExercises =
        [
            
            Exercise(name: "Curls", description: "description", imagePath: "bi2", tips: ["tip1","tip2"], targetMuscle: Exercise.TargetMuscle.biceps.rawValue)
        ]
    
    static var tricepExercises =
        [
            
            Exercise(name: "Rope", description: "description", imagePath: "tri1", tips: ["tip1","tip2"], targetMuscle: Exercise.TargetMuscle.triceps.rawValue)
        ]
    static var schedules =
        [Schedule(dateCreated: Date(), name: "Full Body Workout", playsCounter: 0,exercises: [tricepExercises[0],bicepExercises[0],shoulderExercises[0],backExercises[0],chestExercises[0],legExercises[0],absExercises[0]])]
    
}
