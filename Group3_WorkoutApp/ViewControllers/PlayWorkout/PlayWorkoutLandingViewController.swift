//
//  LandingPlayWorkoutViewController.swift
//  Group3_WorkoutApp
//
//  Created by Ali Alqallaf on 29/12/2021.
//

import UIKit
import SwiftUI

class LandingPlayWorkoutViewController:UIViewController,UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var headerView: UIView!
    @IBOutlet weak var bodyView: UIView!
    @IBOutlet weak var startButton: UIButton!
    @IBOutlet weak var customTableView: UITableView!
    @IBOutlet weak var restTimeButton: UIButton!
    @IBOutlet weak var restTimeLabel: UILabel!
    @IBOutlet weak var scheduleNameLabel: UILabel!
    @IBOutlet weak var scheduleTargetLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // apply default styling
        Constants.applyDefaultStyling(backgroundView: view, headerView: headerView, bodyView: bodyView, mainButton: startButton, secondaryButton: restTimeButton)
        
        setDefaultData()
        
        customTableView.delegate = self
        customTableView.dataSource = self
        //styling table view
        customTableView.separatorStyle = .none
        customTableView.showsVerticalScrollIndicator = false
        
    }
    
    func setDefaultData(){
        scheduleNameLabel.text = DefaultData.schedules[0].name
        scheduleTargetLabel.text = "Full Body"
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return DefaultData.schedules[0].exercises.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = customTableView.dequeueReusableCell(withIdentifier: "customCell") as! CustomTableViewCell
        
        let bgColorView = UIView()
        bgColorView.backgroundColor = AppColors.bodyBg
        cell.selectedBackgroundView = bgColorView
        cell.titleLabel.text = DefaultData.schedules[0].exercises[indexPath.row].name
        cell.subtitleLabel.text = "3 sets x 12 reps"
        cell.cellImage.image = UIImage(named: DefaultData.schedules[0].exercises[indexPath.row].imagePath)
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
    

}
