//
//  QuizViewController.swift
//  Group3_WorkoutApp
//
//  Created by Albaraa Mohammed Janahi  on 03/01/2022.
//

import UIKit

class QuizViewController: UIViewController {

    @IBOutlet weak var Line1: UILabel!
    @IBOutlet weak var Line2: UILabel!
    @IBOutlet weak var bodyView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Setting the default style to the view and the body view by calling a funcation from Constants struct.
        Constants.applyDefaultStyling(backgroundView: view, headerView: nil, bodyView: bodyView, mainButton: nil, secondaryButton: nil)
        // Changing colors to match the app theme by calling AppColors stuct.
        bodyView.backgroundColor = AppColors.bodyBg
        Line1.textColor = AppColors.phoneBg
        Line2.textColor = AppColors.phoneBg
        // Do any additional setup after loading the view.
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
