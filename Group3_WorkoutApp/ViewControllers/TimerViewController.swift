//
//  TimerViewController.swift
//  Group3_WorkoutApp
//
//  Created by Ali Alqallaf on 23/12/2021.
//

import UIKit

class TimerViewController: UIViewController {

    @IBOutlet weak var headerView: UIView!
    @IBOutlet weak var bodyView: UIView!
 
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        // apply default styling for the views
        Constants.buildRoundedUIView(headerView: headerView, bodyView: bodyView, button:nil)
    }
    
}
