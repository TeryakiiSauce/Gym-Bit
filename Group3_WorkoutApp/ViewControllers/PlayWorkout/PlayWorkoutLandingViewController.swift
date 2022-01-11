//
//  LandingPlayWorkoutViewController.swift
//  Group3_WorkoutApp
//
//  Created by Ali Alqallaf on 29/12/2021.
//

import UIKit
import SwiftUI

class PlayWorkoutLandingViewController:UIViewController,UITableViewDataSource, UITableViewDelegate {
    
    // outlets
    @IBOutlet weak var headerView: UIView!
    @IBOutlet weak var bodyView: UIView!
    @IBOutlet weak var startButton: UIButton!
    @IBOutlet weak var customTableView: UITableView!
    @IBOutlet weak var restTimeButton: UIButton!
    @IBOutlet weak var restTimeLabel: UILabel!
    @IBOutlet weak var scheduleNameLabel: UILabel!
    @IBOutlet weak var scheduleTargetLabel: UILabel!
    @IBOutlet weak var selectionLabel: UILabel!
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var targetTitleLabel: UILabel!
    
    
    // default rest time
    static var restTime = 45
    var schedule: Schedule?
    
    override func viewWillAppear(_ animated: Bool) {
        // apply default styling
        Constants.applyDefaultStyling(backgroundView: view, headerView: headerView, bodyView: bodyView, mainButton: startButton, secondaryButton: restTimeButton, vc: self)
        Constants.applyTableAndTextStyling(titleLabels: [scheduleNameLabel], bodyLabels:  [selectionLabel,targetTitleLabel, scheduleTargetLabel, restTimeLabel], tableView: customTableView)
        
        setDefaultData()
        customTableView.reloadData()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        // set schedule to nil  to avoid crashing when activating another schedule
        schedule = nil
    }
    
    func setDefaultData(){
        schedule = DefaultData.user.activeSchedule
        
        if schedule?.exercises.count != 0{
            scheduleNameLabel.text = schedule?.name
            scheduleTargetLabel.text = Constants.targetMuscle(exerciseList: schedule?.exercises ?? [])
            customTableView.delegate = self
            customTableView.dataSource = self
            //styling table view
            customTableView.separatorStyle = .none
            customTableView.showsVerticalScrollIndicator = false
            
            // hide image and label of nil schedule
            selectionLabel.isHidden = true
            image.isHidden = true
        }else{
            customTableView.isHidden = true
            restTimeLabel.isHidden = true
            restTimeButton.isHidden = true
            startButton.isEnabled = false
            scheduleNameLabel.text = "No Active Schedule"
            scheduleTargetLabel.text = "None"
        }
        
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return schedule?.exercises.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = customTableView.dequeueReusableCell(withIdentifier: "customCell") as! CustomTableViewCell
        
        // style the cell and set its data
        Constants.applyCellStyling(cell: cell)
        let bgColorView = UIView()
        cell.selectedBackgroundView = bgColorView
        cell.titleLabel.text = schedule?.exercises[indexPath.item].name
        cell.subtitleLabel.text = "\(schedule?.exercises[indexPath.row].reps ?? 0) reps x \(schedule?.exercises[indexPath.row].sets ?? 0) sets"
        cell.cellImage.image = UIImage(named: schedule?.exercises[indexPath.row].imagePath ?? "")
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        // show workout details screen
        let storyboard = UIStoryboard(name: "ViewWorkout", bundle: nil)
        guard let exerciseDetailsVC = storyboard.instantiateViewController(withIdentifier: "ViewExercisesStoryBoard")  as? ViewDetailExerciseViewController else {return}
        exerciseDetailsVC.imageName = (schedule?.exercises[indexPath.row].imagePath)!
        exerciseDetailsVC.exDescription = (schedule?.exercises[indexPath.row].description)!
        exerciseDetailsVC.exTips = (schedule?.exercises[indexPath.row].tips)!
        exerciseDetailsVC.title = schedule?.exercises[indexPath.row].name
        show(exerciseDetailsVC, sender: tableView)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
    
    
    // present rest time selection view controller modally
    @IBAction func setRestTimeTapped(_ sender: Any) {
        guard let restTimeView = storyboard?.instantiateViewController(identifier: "restTimeView") as? RestTimeViewController else {return}
        restTimeView.modalPresentationStyle = .custom
        restTimeView.transitioningDelegate = self
        present(restTimeView, animated: true)
    }
    
    @IBAction func didUnwindFromSelectRestTime(_ seague: UIStoryboardSegue)
    {
        // set selected time after unwinding
        if let restTimeVc = seague.source as? RestTimeViewController {
            PlayWorkoutLandingViewController.restTime = restTimeVc.totalSeconds
            
            let time = Constants.secondsToMinutesSeconds(seconds: Int(PlayWorkoutLandingViewController.restTime))
            let timeString = Constants.formatTimeString(minutes: time.0, seconds: time.1)
            
            restTimeLabel.text = timeString
        }
        else{
            return
        }
    }
    
    @IBAction func prepareForUnwind(segue: UIStoryboardSegue) {

    }
}

// for presenting rest time view controller in half screen
extension PlayWorkoutLandingViewController: UIViewControllerTransitioningDelegate {
    func presentationController(forPresented presented: UIViewController, presenting: UIViewController?, source: UIViewController) -> UIPresentationController? {
        CustomPresentationController(presentedViewController: presented, presenting: presenting)
    }
}
