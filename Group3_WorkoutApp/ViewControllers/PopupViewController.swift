//
//  PopupViewController.swift
//  Group3_WorkoutApp
//
//  Created by mobileProg on 28/12/2021.
//

import UIKit

class PopupViewController: UIViewController {

    @IBOutlet weak var BodyView: UIView!
    @IBOutlet weak var returnButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.black.withAlphaComponent(0.6)
            
        Constants.buildRoundedUIView(headerView: nil, bodyView: BodyView, button:returnButton)
    }
    
    @IBAction func updateScheduleButton(_ sender: Any) {
        self.view.removeFromSuperview()
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
