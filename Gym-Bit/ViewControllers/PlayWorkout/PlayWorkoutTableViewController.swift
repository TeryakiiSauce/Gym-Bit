//
//  PlayWorkoutTableViewController.swift
//  Group3_WorkoutApp
//
//  Created by Ali Alqallaf on 03/01/2022.
//

import UIKit

class PlayWorkoutTableViewController: UITableViewController, SetCellDelegate, TimerCellDelegate {
    
    // start timer
    func timerButtonTapped() {
        playWorkoutVC?.isCompleted = checkExerciseStatus()
    }
    
    // check set box
    func setButtonTapped() {
        playWorkoutVC?.isCompleted = checkExerciseStatus()
    }
    
    weak var playWorkoutVC : PlayWorkoutViewController?

    @IBOutlet weak var firstSetCell: PlayWorkoutSetTableViewCell!
    @IBOutlet weak var secondSetCell: PlayWorkoutSetTableViewCell!
    @IBOutlet weak var thirdSetCell: PlayWorkoutSetTableViewCell!
    @IBOutlet weak var firstRestCell: PlayWorkoutTimerTableViewCell!
    @IBOutlet weak var secondRestCell: PlayWorkoutTimerTableViewCell!
    @IBOutlet weak var thirdRestCell: PlayWorkoutTimerTableViewCell!
    
    var initialReps: Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // customize table view
        tableView.separatorStyle = .none
        tableView.showsVerticalScrollIndicator = false
    }
    
    override func viewWillAppear(_ animated: Bool) {
        setInitailReps()
        // set table view bg color
        tableView.backgroundColor = AppColors.bodyBg
    }

    // set initial exercise reps
    func setInitailReps(){
        firstSetCell.repsLabel.text = "\(initialReps ?? 99) reps"
        secondSetCell.repsLabel.text = "\(initialReps ?? 99) reps"
        thirdSetCell.repsLabel.text = "\(initialReps ?? 99) reps"
    }
    
    // set actual reps
    func setReps(reps: Int){
        let cells = self.tableView.visibleCells
        
        for cell in cells {
            if let cell = cell as? PlayWorkoutSetTableViewCell {
                cell.repsLabel.text = "\(reps) reps"
            }
        }
    }
    
    // reset table (check marks) when navigating to the next exercise
    func resetTable(){
        let cells = self.tableView.visibleCells
        
        for cell in cells {
            if let cell = cell as? PlayWorkoutSetTableViewCell {
                cell.resetCell()
            }else if let cell = cell as? PlayWorkoutTimerTableViewCell {
                cell.resetCell()
            }
        }
        playWorkoutVC?.isCompleted = false
    }
    
    // handle the navigation to the next exercise (allow only when all sets and timers are checked)
    func checkExerciseStatus() -> Bool {
        if(firstSetCell.isChecked && secondSetCell.isChecked && thirdSetCell.isChecked && firstRestCell.isCompleted && secondRestCell.isCompleted && thirdRestCell.isCompleted)
        {
            return true
        }else{
            return false
        }
    }
    
    override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if let cell = cell as? PlayWorkoutSetTableViewCell {
            cell.delegate = self
        }
        else if let cell = cell as? PlayWorkoutTimerTableViewCell {
            cell.delegate = self
        }
    }

    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
          tableView.deselectRow(at: indexPath, animated: true)
            // check set box
            setButtonTapped()
      }
}



