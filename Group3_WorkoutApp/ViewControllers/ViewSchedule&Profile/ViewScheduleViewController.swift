//
//  ViewScheduleViewController.swift
//  Group3_WorkoutApp
//
//  Created by mobileProg on 06/01/2022.
//

import UIKit

class ViewScheduleViewController: UIViewController,UITableViewDataSource, UITableViewDelegate {

        // filling data to test
        var displayedSchedule = Schedule(dateCreated: Date(), name: "Your Schedule", playsCounter: nil, exercises: [])
        
        // connectors that connect the gui to code
    @IBOutlet weak var headerView: UIView!
    @IBOutlet weak var bodyView: UIView!
    @IBOutlet weak var mainBtn: UIButton!
    @IBOutlet weak var customTableView: UITableView!
    @IBOutlet weak var scheduleName: UILabel!
    @IBOutlet weak var IconImage: UIImageView!
    
        
        //view did load function
        override func viewDidLoad() {
            super.viewDidLoad()
            // apply default styling
            customTableView.delegate = self
            customTableView.dataSource = self
            //styling table view
            customTableView.separatorStyle = .none
            customTableView.showsVerticalScrollIndicator = false
            scheduleName.text = displayedSchedule.name
        }
       
        //function that sets the number of rows in the exercises table
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return displayedSchedule.exercises.count
        }
        
        //function that fills the exercise table
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            //creating a cell identifier
            let cell = customTableView.dequeueReusableCell(withIdentifier: "customCell") as! CustomTableViewCell
            //adding data to the cell
            cell.titleLabel.text = displayedSchedule.exercises[indexPath.row].name
            cell.subtitleLabel.text = displayedSchedule.exercises[indexPath.row].targetMuscle
            cell.cellImage.image = UIImage(named: displayedSchedule.exercises[indexPath.row].imagePath)
            return cell
        }

        //function that sets the row height for the table
        func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
            return 120
        }
    }
