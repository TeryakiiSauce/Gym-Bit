//
//  CompleteWorkoutPopupViewController.swift
//  Group3_WorkoutApp
//
//  Created by Ali Alqallaf on 05/01/2022.
//

import UIKit

protocol CompleteWorkoutDelegate:AnyObject  {
    
    func finishWorkout()
}
class CompleteWorkoutPopupViewController: UIViewController {

    
    weak var delegate: CompleteWorkoutDelegate?

    // outlets
    @IBOutlet weak var bodyView: UIView!
    @IBOutlet weak var continueButton: UIButton!
    @IBOutlet weak var completeLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    
    var totalMinutes: Int?
    override func viewDidLoad() {
        super.viewDidLoad()
        //setting the background to be dimmed when the page is up
        self.view.backgroundColor = UIColor.black.withAlphaComponent(0.6)
        // apply styling
        Constants.applyDefaultStyling(backgroundView: nil, headerView: nil, bodyView: bodyView, mainButton: continueButton, secondaryButton: nil, vc: nil)
        Constants.applyTableAndTextStyling(titleLabels: [titleLabel], bodyLabels: [completeLabel], tableView: nil)
        // set completion message 
        completeLabel.text = "You have completed your workout in \(totalMinutes ?? 0) minutes"
    }
    @IBAction func continueTapped(_ sender: Any) {
        delegate?.finishWorkout()
        self.view.removeFromSuperview()
    }
    
}
