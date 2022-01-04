//
//  DefaultData.swift
//  Group3_WorkoutApp
//
//  Created by Ali Alqallaf on 01/01/2022.
//

import Foundation

struct DefaultData {
    
    //instance of user
    static var user = User(dateJoined: Date(), fullName: "Mike Gonzalis", height: 177, weight: 68, goalWeight: 70, dailyWorkoutMinutes: nil, dailyCardioMinutes: nil, avgWeeklyWorkoutMinutes: nil, avgWeeklyCardioMinutes: nil, totalyWorkoutMinutes: nil, totalCardioMinutes: nil, totalWorkedoutDays: nil, workoutStreak: nil, schedules: schedules, activeSchedule: schedules[0])
    
    //default instance of exercises
    static var backExercises =
        [
            Exercise(name: "Pull down7", description: "description", imagePath: "back2", tips: ["tip1","tip2"], targetMuscle: Exercise.TargetMuscle.back.rawValue),
            Exercise(name: "Pull down6", description: "description", imagePath: "back2", tips: ["tip1","tip2"], targetMuscle: Exercise.TargetMuscle.back.rawValue),
            Exercise(name: "Pull down5", description: "description", imagePath: "back2", tips: ["tip1","tip2"], targetMuscle: Exercise.TargetMuscle.back.rawValue),
            Exercise(name: "Pull down4", description: "description", imagePath: "back2", tips: ["tip1","tip2"], targetMuscle: Exercise.TargetMuscle.back.rawValue),
            Exercise(name: "Pull down3", description: "description", imagePath: "back2", tips: ["tip1","tip2"], targetMuscle: Exercise.TargetMuscle.back.rawValue),
            Exercise(name: "Pull down2", description: "description", imagePath: "back2", tips: ["tip1","tip2"], targetMuscle: Exercise.TargetMuscle.back.rawValue),
            Exercise(name: "Pull down1", description: "description", imagePath: "back2", tips: ["tip1","tip2"], targetMuscle: Exercise.TargetMuscle.back.rawValue),
        ]
    
    static var chestExercises =
        [
            Exercise(name: "Chest bench Press7", description: "description", imagePath: "chest1", tips: ["tip1","tip2"], targetMuscle: Exercise.TargetMuscle.chest.rawValue),
            Exercise(name: "Chest bench Press6", description: "description", imagePath: "chest1", tips: ["tip1","tip2"], targetMuscle: Exercise.TargetMuscle.chest.rawValue),
            Exercise(name: "Chest bench Press5", description: "description", imagePath: "chest1", tips: ["tip1","tip2"], targetMuscle: Exercise.TargetMuscle.chest.rawValue),
            Exercise(name: "Chest bench Press4", description: "description", imagePath: "chest1", tips: ["tip1","tip2"], targetMuscle: Exercise.TargetMuscle.chest.rawValue),
            Exercise(name: "Chest bench Press3", description: "description", imagePath: "chest1", tips: ["tip1","tip2"], targetMuscle: Exercise.TargetMuscle.chest.rawValue),
            Exercise(name: "Chest bench Press2", description: "description", imagePath: "chest1", tips: ["tip1","tip2"], targetMuscle: Exercise.TargetMuscle.chest.rawValue),
            Exercise(name: "Chest bench Press1", description: "description", imagePath: "chest1", tips: ["tip1","tip2"], targetMuscle: Exercise.TargetMuscle.chest.rawValue),
        ]
    
    static var shoulderExercises =
        [
            Exercise(name: "Shoulder Press7", description: "description", imagePath: "shoulder2", tips: ["tip1","tip2"], targetMuscle: Exercise.TargetMuscle.shoulders.rawValue),
            Exercise(name: "Shoulder Press6", description: "description", imagePath: "shoulder2", tips: ["tip1","tip2"], targetMuscle: Exercise.TargetMuscle.shoulders.rawValue),
            Exercise(name: "Shoulder Press5", description: "description", imagePath: "shoulder2", tips: ["tip1","tip2"], targetMuscle: Exercise.TargetMuscle.shoulders.rawValue),
            Exercise(name: "Shoulder Press4", description: "description", imagePath: "shoulder2", tips: ["tip1","tip2"], targetMuscle: Exercise.TargetMuscle.shoulders.rawValue),
            Exercise(name: "Shoulder Press3", description: "description", imagePath: "shoulder2", tips: ["tip1","tip2"], targetMuscle: Exercise.TargetMuscle.shoulders.rawValue),
            Exercise(name: "Shoulder Press2", description: "description", imagePath: "shoulder2", tips: ["tip1","tip2"], targetMuscle: Exercise.TargetMuscle.shoulders.rawValue),
            Exercise(name: "Shoulder Press1", description: "description", imagePath: "shoulder2", tips: ["tip1","tip2"], targetMuscle: Exercise.TargetMuscle.shoulders.rawValue),
            
        ]
    
    static var legExercises =
        [
            Exercise(name: "Leg Press7", description: "description", imagePath: "legs1", tips: ["tip1","tip2"], targetMuscle: Exercise.TargetMuscle.legs.rawValue),
            Exercise(name: "Leg Press6", description: "description", imagePath: "legs1", tips: ["tip1","tip2"], targetMuscle: Exercise.TargetMuscle.legs.rawValue),
            Exercise(name: "Leg Press5", description: "description", imagePath: "legs1", tips: ["tip1","tip2"], targetMuscle: Exercise.TargetMuscle.legs.rawValue),
            Exercise(name: "Leg Press4", description: "description", imagePath: "legs1", tips: ["tip1","tip2"], targetMuscle: Exercise.TargetMuscle.legs.rawValue),
            Exercise(name: "Leg Press3", description: "description", imagePath: "legs1", tips: ["tip1","tip2"], targetMuscle: Exercise.TargetMuscle.legs.rawValue),
            Exercise(name: "Leg Press2", description: "description", imagePath: "legs1", tips: ["tip1","tip2"], targetMuscle: Exercise.TargetMuscle.legs.rawValue),
            Exercise(name: "Leg Press1", description: "description", imagePath: "legs1", tips: ["tip1","tip2"], targetMuscle: Exercise.TargetMuscle.legs.rawValue),
            
        ]
    
    static var absExercises =
        [
            Exercise(name: "Crunches1", description: "description", imagePath: "abs1", tips: ["tip1","tip2"], targetMuscle: Exercise.TargetMuscle.abs.rawValue),
            Exercise(name: "Crunches2", description: "description", imagePath: "abs1", tips: ["tip1","tip2"], targetMuscle: Exercise.TargetMuscle.abs.rawValue),
            Exercise(name: "Crunches3", description: "description", imagePath: "abs1", tips: ["tip1","tip2"], targetMuscle: Exercise.TargetMuscle.abs.rawValue),
            Exercise(name: "Crunches4", description: "description", imagePath: "abs1", tips: ["tip1","tip2"], targetMuscle: Exercise.TargetMuscle.abs.rawValue),
            Exercise(name: "Crunches5", description: "description", imagePath: "abs1", tips: ["tip1","tip2"], targetMuscle: Exercise.TargetMuscle.abs.rawValue),
            Exercise(name: "Crunches6", description: "description", imagePath: "abs1", tips: ["tip1","tip2"], targetMuscle: Exercise.TargetMuscle.abs.rawValue),
            Exercise(name: "Crunches7", description: "description", imagePath: "abs1", tips: ["tip1","tip2"], targetMuscle: Exercise.TargetMuscle.abs.rawValue),
        ]
    
    static var bicepExercises =
        [
            Exercise(name: "Curls1", description: "description", imagePath: "bi2", tips: ["tip1","tip2"], targetMuscle: Exercise.TargetMuscle.biceps.rawValue),
            Exercise(name: "Curls2", description: "description", imagePath: "bi2", tips: ["tip1","tip2"], targetMuscle: Exercise.TargetMuscle.biceps.rawValue),
            Exercise(name: "Curls3", description: "description", imagePath: "bi2", tips: ["tip1","tip2"], targetMuscle: Exercise.TargetMuscle.biceps.rawValue),
            Exercise(name: "Curls4", description: "description", imagePath: "bi2", tips: ["tip1","tip2"], targetMuscle: Exercise.TargetMuscle.biceps.rawValue),
            Exercise(name: "Curls5", description: "description", imagePath: "bi2", tips: ["tip1","tip2"], targetMuscle: Exercise.TargetMuscle.biceps.rawValue),
            Exercise(name: "Curls6", description: "description", imagePath: "bi2", tips: ["tip1","tip2"], targetMuscle: Exercise.TargetMuscle.biceps.rawValue),
            Exercise(name: "Curls7", description: "description", imagePath: "bi2", tips: ["tip1","tip2"], targetMuscle: Exercise.TargetMuscle.biceps.rawValue),
        ]
    
    static var tricepExercises =
        [
            Exercise(name: "Rope", description: "description1", imagePath: "tri1", tips: ["tip1","tip2"], targetMuscle: Exercise.TargetMuscle.triceps.rawValue),
            Exercise(name: "Rope", description: "description2", imagePath: "tri1", tips: ["tip1","tip2"], targetMuscle: Exercise.TargetMuscle.triceps.rawValue),
            Exercise(name: "Rope", description: "description3", imagePath: "tri1", tips: ["tip1","tip2"], targetMuscle: Exercise.TargetMuscle.triceps.rawValue),
            Exercise(name: "Rope", description: "description4", imagePath: "tri1", tips: ["tip1","tip2"], targetMuscle: Exercise.TargetMuscle.triceps.rawValue),
            Exercise(name: "Rope", description: "description5", imagePath: "tri1", tips: ["tip1","tip2"], targetMuscle: Exercise.TargetMuscle.triceps.rawValue),
            Exercise(name: "Rope", description: "description6", imagePath: "tri1", tips: ["tip1","tip2"], targetMuscle: Exercise.TargetMuscle.triceps.rawValue),
            Exercise(name: "Rope", description: "description7", imagePath: "tri1", tips: ["tip1","tip2"], targetMuscle: Exercise.TargetMuscle.triceps.rawValue),
        ]
    
    
    
    // creating a default schedule
    static var schedules =
        [Schedule(dateCreated: Date(), name: "Full Body Workout", playsCounter: 0,exercises: [tricepExercises[0],bicepExercises[0],shoulderExercises[0],backExercises[0],chestExercises[0],legExercises[0],absExercises[0]])]
    
}
