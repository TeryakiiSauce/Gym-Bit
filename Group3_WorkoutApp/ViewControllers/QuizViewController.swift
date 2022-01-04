//
//  QuizViewController.swift
//  Group3_WorkoutApp
//
//  Created by Albaraa Mohammed Janahi  on 03/01/2022.
//

import UIKit

class QuizViewController: UIViewController {

    @IBOutlet weak var HeadLabel: UILabel!
    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var Line1: UILabel!
    @IBOutlet weak var Line2: UILabel!
    @IBOutlet weak var Line3: UILabel!
    @IBOutlet weak var Line4: UILabel!
    @IBOutlet weak var bodyView: UIView!
    @IBOutlet weak var finishButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Setting the default style to the view and the body view by calling a funcation from Constants struct.
        Constants.applyDefaultStyling(backgroundView: view, headerView: nil, bodyView: bodyView, mainButton: finishButton, secondaryButton: nil)
        // Changing colors to match the app theme by calling AppColors stuct.
        bodyView.backgroundColor = AppColors.bodyBg
        nameField.textColor = AppColors.phoneBg
        Line1.textColor = AppColors.phoneBg
        Line2.textColor = AppColors.phoneBg
        Line3.textColor = AppColors.phoneBg
        Line4.textColor = AppColors.phoneBg
        // Changing the style of the first part of the head text to bold.
        let firstPart = "Before you get started, "
        let attrs = [NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 27)]
        let attributedString = NSMutableAttributedString(string:firstPart, attributes:attrs)

        let secondPart = "we would like to personalize your app for you.."
        let normalString = NSMutableAttributedString(string:secondPart)

        attributedString.append(normalString)
        HeadLabel.attributedText = attributedString
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
