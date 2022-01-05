//
//  RestPopupViewController.swift
//  Group3_WorkoutApp
//
//  Created by Ali Alqallaf on 05/01/2022.
//

import UIKit

class ResetTimerPopupViewController: UIViewController {
    @IBOutlet weak var bodyView: UIView!
    @IBOutlet weak var cancelButton: UIButton!
    @IBOutlet weak var yesButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //setting the background to be dimmed when the page is up
        self.view.backgroundColor = UIColor.black.withAlphaComponent(0.6)
        //method that makes the views have round edges
        Constants.applyDefaultStyling(backgroundView: nil, headerView: nil, bodyView: bodyView, mainButton: yesButton, secondaryButton: cancelButton)
    }
    @IBAction func cancelTapped(_ sender: Any) {
        self.view.removeFromSuperview()
    }
}
