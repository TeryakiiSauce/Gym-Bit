//
//  PlayWorkoutViewController.swift
//  Group3_WorkoutApp
//
//  Created by Ali Alqallaf on 03/01/2022.
//

import UIKit

class PlayWorkoutViewController: UIViewController {
    
    
    
    @IBOutlet weak var headerView: UIView!
    @IBOutlet weak var bodyView: UIView!
    @IBOutlet weak var mainButton: UIButton!
    @IBOutlet weak var currentExerciseNoLabel: UILabel!
    @IBOutlet weak var totalExercisesLabel: UILabel!
    @IBOutlet weak var progressView: UIProgressView!
    @IBOutlet weak var exerciseNameLabel: UILabel!
    
    var exerciseIndex = 0
    var schedule = DefaultData.user.activeSchedule
    var exercisesCount: Int?
    
    var progress = Progress(totalUnitCount: Int64(DefaultData.schedules[0].exercises.count))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // apply default styling
        Constants.applyDefaultStyling(backgroundView: view, headerView: headerView, bodyView: bodyView, mainButton: mainButton, secondaryButton: nil)
        // set exercises count
        exercisesCount = schedule?.exercises.count

        // set total exercises
        totalExercisesLabel.text = "/ \(String(exercisesCount!))"
        
        customizeProgressView()
        setExerciseInfo()
        updateProgressView()
        
        print("Selected Rest time \(PlayWorkoutLandingViewController.restTime)")
    }
    
    func customizeProgressView(){
        // cahnge height of the progress view
        progressView.transform =  progressView.transform.scaledBy (x: 1, y: 2)
        // set rounded edges
        progressView.layer.cornerRadius = 5
        progressView.clipsToBounds = true
    }
    
    func updateProgressView(){
        guard !progress.isFinished else {return}
        progress.completedUnitCount += 1
        let progressFloat = Float(self.progress.fractionCompleted)
        self.progressView.setProgress(progressFloat, animated: true)
    }
    
    // set exercises name and index based on the exercise index
    func setExerciseInfo(){
        currentExerciseNoLabel.text = String(exerciseIndex + 1)
        exerciseNameLabel.text = DefaultData.schedules[0].exercises[exerciseIndex].name
    }
    
    @IBAction func nextButtonTapped(_ sender: Any) {
        
        // change button title when reaching the last exercise
        if exerciseIndex == exercisesCount! - 2 {
            mainButton.setTitle("Finish", for: .normal)
        }
        
        if exerciseIndex == exercisesCount! - 1 {
            // display pop up
            dismiss(animated: true, completion: nil)
        }else{
            exerciseIndex += 1
            updateProgressView()
            setExerciseInfo()
        }
    }
}
