//
//  ViewController.swift
//  Group3_WorkoutApp
//
//  Created by Ali Alqallaf on 13/12/2021.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var displayedSchedule = [DefaultData.schedules[0]]
    
    @IBOutlet weak var headerView: UIView!
    @IBOutlet weak var bodyView: UIView!
    @IBOutlet weak var mainButton: UIButton!
    @IBOutlet weak var customTableView: UITableView!
    @IBOutlet weak var SecondayButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // apply default styling
        Constants.applyDefaultStyling(backgroundView: view, headerView: headerView, bodyView: bodyView, mainButton: mainButton, secondaryButton: SecondayButton)
        customTableView.delegate = self
        customTableView.dataSource = self
        //styling table view
        customTableView.separatorStyle = .none
        customTableView.showsVerticalScrollIndicator = false
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender:Any?) {
        //setting controller variable
        if segue.identifier == "createPage"{
        let viewController = segue.destination as! CreateScheduleViewController
        viewController.displayedSchedule = DefaultData.schedules[0]
            viewController.originalschedule = DefaultData.schedules[0]}
        else{}
       
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return DefaultData.schedules.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = customTableView.dequeueReusableCell(withIdentifier: "customCell") as! CustomTableViewCell
        cell.titleLabel.text = displayedSchedule[indexPath.row].name
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 110
    
    }
    
  
}
    



