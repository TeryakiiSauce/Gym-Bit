//
//  PlayWorkoutViewController.swift
//  Group3_WorkoutApp
//
//  Created by Ali Alqallaf on 03/01/2022.
//

import UIKit

class PlayWorkoutViewController: UIViewController, CompleteWorkoutDelegate {
    
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
    var cardioTime: Double?
    var startWorkoutTime: Date?
    var endWorkoutTime: Date?
    
    // to access table view
    var tableViewController : PlayWorkoutTableViewController?
    var isCompleted = false {
        didSet{
            setButtonStateButton()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // set table view to the first embedded view controller (play workout table)
        tableViewController = self.children[0] as? PlayWorkoutTableViewController
        
        // set initial reps to be used for first exercise
        tableViewController?.initialReps = schedule?.exercises[exerciseIndex].reps
        tableViewController?.playWorkoutVC = self
        // apply default styling
        Constants.applyDefaultStyling(backgroundView: view, headerView: headerView, bodyView: bodyView, mainButton: mainButton, secondaryButton: nil)
        // set exercises count
        exercisesCount = schedule?.exercises.count

        // set total exercises
        totalExercisesLabel.text = "/ \(String(exercisesCount!))"
        
        customizeProgressView()
        setExerciseInfo()
        updateProgressView()
        setButtonStateButton()
    }
    
    func setButtonStateButton(){
        if isCompleted {
            mainButton.isEnabled = true
            mainButton.alpha = 1
        }else{
            mainButton.isEnabled = false
            mainButton.alpha = 0.5
        }
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
    
    func finishWorkout() {
       
        // display pop up
        dismiss(animated: true, completion: nil)
        navigationController?.popToRootViewController(animated: true)

    }
    
    func calcWorkoutTimeInMinutes() -> Double {
        // get both times sinces refrenced date and divide by 60 to get minutes
        let endDateMinutes = endWorkoutTime!.timeIntervalSinceReferenceDate/60
        let startDateMinutes = startWorkoutTime!.timeIntervalSinceReferenceDate/60

        // return the difference
        return Double(endDateMinutes - startDateMinutes)
    }
    
    @IBAction func nextButtonTapped(_ sender: Any) {
        
        // change button title when reaching the last exercise
        if exerciseIndex == exercisesCount! - 2 {
            mainButton.setTitle("Finish", for: .normal)
        }
        
        if exerciseIndex == exercisesCount! - 1 {
            // instantiate alret dialog
            guard let alertVC = UIStoryboard(name: "PlayWorkout", bundle: nil).instantiateViewController(withIdentifier: "completeWorkoutViewController") as? CompleteWorkoutPopupViewController else {return}
            
            endWorkoutTime = Date()
            
            let totalWorkoutTime = calcWorkoutTimeInMinutes()
            
            alertVC.totalMinutes = Int(totalWorkoutTime)
            // pass timer controller
            alertVC.delegate = self
            // add alert to the view controller
            self.addChild(alertVC)
            alertVC.view.frame = self.view.frame
            self.view.addSubview(alertVC.view)
            alertVC.didMove(toParent: self)
            
        }else{
            exerciseIndex += 1
            updateProgressView()
            setExerciseInfo()
            // update reps
            tableViewController?.setReps(reps: schedule?.exercises[exerciseIndex].reps ?? 99)
            // reset table
            tableViewController?.resetTable()
        }
    }
}
