//
//  PlayWorkoutViewController.swift
//  Group3_WorkoutApp
//
//  Created by Ali Alqallaf on 03/01/2022.
//

import UIKit
import Foundation

class PlayWorkoutViewController: UIViewController, CompleteWorkoutDelegate {
    
    // outlets
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
    var progress = Progress(totalUnitCount: Int64((DefaultData.user.activeSchedule?.exercises.count)!))
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
        // set exercises count
        exercisesCount = schedule?.exercises.count

        // set total exercises
        totalExercisesLabel.text = "/ \(String(exercisesCount!))"
        
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(exerciseLabelTapped(tapGestureRecognizer:)))
        exerciseNameLabel.isUserInteractionEnabled = true
        exerciseNameLabel.addGestureRecognizer(tapGestureRecognizer)
        
        customizeProgressView()
        setExerciseInfo()
        updateProgressView()
        setButtonStateButton()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        // apply default styling
        Constants.applyDefaultStyling(backgroundView: view, headerView: headerView, bodyView: bodyView, mainButton: mainButton, secondaryButton: nil, vc: self)
        Constants.applyTableAndTextStyling(titleLabels: [exerciseNameLabel], bodyLabels: [], tableView: nil)
    }
    
    // show exercise details when clicking on the exercise name
    @objc func exerciseLabelTapped(tapGestureRecognizer: UITapGestureRecognizer)
    {
        let storyboard = UIStoryboard(name: "ViewWorkout", bundle: nil)
        guard let exerciseDetailsVC = storyboard.instantiateViewController(withIdentifier: "ViewExercisesStoryBoard")  as? ViewDetailExerciseViewController else {return}
        //setting controller variable
        exerciseDetailsVC.imageName = (schedule?.exercises[exerciseIndex].imagePath)!
        exerciseDetailsVC.exDescription = (schedule?.exercises[exerciseIndex].description)!
        exerciseDetailsVC.exTips = (schedule?.exercises[exerciseIndex].tips)!
        exerciseDetailsVC.title = schedule?.exercises[exerciseIndex].name
        show(exerciseDetailsVC, sender: tapGestureRecognizer)
    }
    
    // disable the button only when all rest and sets are completed
    func setButtonStateButton(){
        if isCompleted {
            mainButton.isEnabled = true
            mainButton.alpha = 1
        }else{
            mainButton.isEnabled = false
            mainButton.alpha = 0.5
        }
    }
    
    // customize progress view
    func customizeProgressView(){
        // cahnge height of the progress view
        progressView.transform =  progressView.transform.scaledBy (x: 1, y: 2)
        // set rounded edges
        progressView.layer.cornerRadius = 5
        progressView.clipsToBounds = true
    }
    
    // update progress view when clicking on next
    func updateProgressView(){
        guard !progress.isFinished else {return}
        progress.completedUnitCount += 1
        let progressFloat = Float(self.progress.fractionCompleted)
        self.progressView.setProgress(progressFloat, animated: true)
    }
    
    // set exercises name and index based on the exercise index
    func setExerciseInfo(){
        currentExerciseNoLabel.text = String(exerciseIndex + 1)
        exerciseNameLabel.text = DefaultData.user.activeSchedule?.exercises[exerciseIndex].name
    }
    
    // calculate workout time
    func calcWorkoutTimeInMinutes() -> Double {
        // get both times sinces refrenced date and divide by 60 to get minutes
        let endDateMinutes = endWorkoutTime!.timeIntervalSinceReferenceDate/60
        let startDateMinutes = startWorkoutTime!.timeIntervalSinceReferenceDate/60
        // return the difference
        return Double(endDateMinutes - startDateMinutes)
    }
    
    
    // next or finish button tapped
    @IBAction func nextButtonTapped(_ sender: Any) {
        
        // change button title when reaching the last exercise
        if exerciseIndex == exercisesCount! - 2 {
            mainButton.setTitle("Finish", for: .normal)
        }
        
        // when reaching the last exercise and clicking finish
        if exerciseIndex == exercisesCount! - 1 {
            // instantiate alret dialog
            guard let alertVC = UIStoryboard(name: "PlayWorkout", bundle: nil).instantiateViewController(withIdentifier: "completeWorkoutViewController") as? CompleteWorkoutPopupViewController else {return}
            
            // set ending time
            endWorkoutTime = Date()
            
            // calculate workout time
            let totalWorkoutTime = calcWorkoutTimeInMinutes()
            
            // get workout data (list of dictionaries) if exists
            if var workoutData = Constants.getWorkoutData() {
                // append new values
                workoutData.append(["workoutTime": totalWorkoutTime, "cardioTime":cardioTime ?? 0])
                // save new list
                Constants.saveWorkoutData(workoutData)
            }else{
                Constants.saveWorkoutData([["workoutTime": totalWorkoutTime, "cardioTime":cardioTime ?? 0]])
            }

            // get workout date list if exists
            if var workoutDates = Constants.getPlayingWorkoutDates() {
                // append new values
                workoutDates.append(endWorkoutTime!)
                // save new list
                Constants.savePlayingWorkoutDates(workoutDates)
            }else{
                // save new list
                Constants.savePlayingWorkoutDates([endWorkoutTime!])
            }
            
            // get schedule data dictionary
            //var selectedSchedule = Schedule.getActivatedSchedule()
            
            // print(selectedSchedule) // successful
            
            //selectedSchedule.incPlayCounter()
            //print(selectedSchedule.playsCounter)
            
            
            if var scheduleData = Constants.getPlayedScheduleData() {
                
                // check if schedule exists
                if scheduleData[schedule!.name] != nil {
                    scheduleData[schedule!.name]! += 1
                }else {
                    scheduleData[schedule!.name] = 1
                }
                // save dic
                Constants.savePlayedScheduleData(scheduleData)
                
            }else{
                // save new dic
                Constants.savePlayedScheduleData([schedule!.name: 1])
            }
            
            // display pop up to indicate the end of the workout
            alertVC.totalMinutes = Int(totalWorkoutTime)
            // pass timer controller
            alertVC.delegate = self
            // add alert to the view controller
            self.addChild(alertVC)
            alertVC.view.frame = self.view.frame
            self.view.addSubview(alertVC.view)
            alertVC.didMove(toParent: self)
            
        }else{
            // when going to next exercise
            exerciseIndex += 1
            updateProgressView()
            setExerciseInfo()
            // update reps
            tableViewController?.setReps(reps: schedule?.exercises[exerciseIndex].reps ?? 99)
            // reset table
            tableViewController?.resetTable()
        }
    }
    
    // go to the landing screen when finishing the workout
    func finishWorkout() {
        // display pop up
        dismiss(animated: true, completion: nil)
        // navigate to the first screen
        self.performSegue(withIdentifier: "unwindToWorkoutLandingViewController", sender: self)

    }
}
