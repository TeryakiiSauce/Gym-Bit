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

    @IBOutlet weak var bodyView: UIView!
    @IBOutlet weak var continueButton: UIButton!
    @IBOutlet weak var completeLabel: UILabel!
    
    var totalMinutes: Int?
    override func viewDidLoad() {
        super.viewDidLoad()
        //setting the background to be dimmed when the page is up
        self.view.backgroundColor = UIColor.black.withAlphaComponent(0.6)
        //method that makes the views have round edges
        Constants.applyDefaultStyling(backgroundView: nil, headerView: nil, bodyView: bodyView, mainButton: continueButton, secondaryButton: nil, vc: nil)
        
        completeLabel.text = "You have completed your workout in \(totalMinutes ?? 0) minutes"
    }
    @IBAction func continueTapped(_ sender: Any) {
        delegate?.finishWorkout()
        self.view.removeFromSuperview()
    }
    
}
