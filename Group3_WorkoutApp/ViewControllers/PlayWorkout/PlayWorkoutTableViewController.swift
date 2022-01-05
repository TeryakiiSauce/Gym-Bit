//
//  PlayWorkoutTableViewController.swift
//  Group3_WorkoutApp
//
//  Created by Ali Alqallaf on 03/01/2022.
//

import UIKit

class PlayWorkoutTableViewController: UITableViewController {
    
    @IBOutlet weak var firstSetCell: PlayWorkoutSetTableViewCell!
    @IBOutlet weak var secondSetCell: PlayWorkoutSetTableViewCell!
    @IBOutlet weak var thirdSetCell: PlayWorkoutSetTableViewCell!
    
    var initialReps: Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.separatorStyle = .none
        tableView.showsVerticalScrollIndicator = false
    }
    
    override func viewWillAppear(_ animated: Bool) {
        setInitailReps()
    }

    
    func setInitailReps(){
        firstSetCell.repsLabel.text = "\(initialReps ?? 99) reps"
        secondSetCell.repsLabel.text = "\(initialReps ?? 99) reps"
        thirdSetCell.repsLabel.text = "\(initialReps ?? 99) reps"
    }
    
    func setReps(reps: Int){
        let cells = self.tableView.visibleCells
        
        for cell in cells {
            if let cell = cell as? PlayWorkoutSetTableViewCell {
                cell.repsLabel.text = "\(reps) reps"
            }
        }
    }
    
    func resetTable(){
        let cells = self.tableView.visibleCells
        
        for cell in cells {
            if let cell = cell as? PlayWorkoutSetTableViewCell {
                cell.resetCell()
            }else if let cell = cell as? PlayWorkoutTimerTableViewCell {
                cell.resetCell()
            }
        }
    }
}


