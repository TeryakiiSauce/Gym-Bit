//
//  RestPopupViewController.swift
//  Group3_WorkoutApp
//
//  Created by Ali Alqallaf on 05/01/2022.
//

import UIKit

protocol ResetTimeDelegate:AnyObject  {
    
    func yesButtonTapped()
}
class ResetTimerPopupViewController: UIViewController {
    
    weak var delegate: ResetTimeDelegate?
    @IBOutlet weak var bodyView: UIView!
    @IBOutlet weak var cancelButton: UIButton!
    @IBOutlet weak var yesButton: UIButton!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var msgLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //setting the background to be dimmed when the page is up
        self.view.backgroundColor = UIColor.black.withAlphaComponent(0.6)
        // apply styling
        Constants.applyDefaultStyling(backgroundView: nil, headerView: nil, bodyView: bodyView, mainButton: yesButton, secondaryButton: cancelButton, vc: nil)
        Constants.applyTableAndTextStyling(titleLabels: [titleLabel], bodyLabels: [msgLabel], tableView: nil)
    }
    
    // remove the pop up
    @IBAction func cancelTapped(_ sender: Any) {
        self.view.removeFromSuperview()
    }
    
    // implement the yes function and remove the pop up
    @IBAction func yesTapped(_ sender: Any) {
        delegate?.yesButtonTapped()
        self.view.removeFromSuperview()
    }
}
