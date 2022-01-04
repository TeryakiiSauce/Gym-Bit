//
//  QuizViewController.swift
//  Group3_WorkoutApp
//
//  Created by Albaraa Mohammed Janahi  on 03/01/2022.
//

import UIKit

class QuizViewController: UIViewController {
    
    var switchOnImg: UIImage = UIImage(named: "switch_off.svg")!
    var switchOffImg: UIImage = UIImage(named: "switch_on.svg")!

    @IBOutlet weak var HeadLabel: UILabel!
    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var ageTxt: UILabel!
    @IBOutlet weak var heightTxt: UILabel!
    @IBOutlet weak var weightTxt: UILabel!
    @IBOutlet weak var goalTxt: UILabel!
    @IBOutlet weak var yearsValue: UILabel!
    @IBOutlet weak var heightValue: UILabel!
    @IBOutlet weak var weightValue: UILabel!
    @IBOutlet weak var goalValue: UILabel!
    @IBOutlet weak var Line1: UILabel!
    @IBOutlet weak var Line2: UILabel!
    @IBOutlet weak var Line3: UILabel!
    @IBOutlet weak var Line4: UILabel!
    @IBOutlet weak var unitTxt: UILabel!
    @IBOutlet weak var slider1: UISlider!
    @IBOutlet weak var slider2: UISlider!
    @IBOutlet weak var slider3: UISlider!
    @IBOutlet weak var slider4: UISlider!
    @IBOutlet weak var bodyView: UIView!
    @IBOutlet weak var unitSwitch: UIImageView!
    @IBOutlet weak var finishButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Setting the default style to the view and the body view by calling a funcation from Constants struct.
        Constants.applyDefaultStyling(backgroundView: view, headerView: nil, bodyView: bodyView, mainButton: finishButton, secondaryButton: nil)
        // Changing colors to match the app theme by calling AppColors stuct.
        HeadLabel.textColor = AppColors.textColor
        bodyView.backgroundColor = AppColors.bodyBg
        nameField.textColor = AppColors.phoneBg
        Line1.textColor = AppColors.phoneBg
        Line2.textColor = AppColors.phoneBg
        Line3.textColor = AppColors.phoneBg
        Line4.textColor = AppColors.phoneBg
        ageTxt.textColor = AppColors.textColor
        heightTxt.textColor = AppColors.textColor
        weightTxt.textColor = AppColors.textColor
        goalTxt.textColor = AppColors.textColor
        unitTxt.textColor = AppColors.textColor
        yearsValue.textColor = AppColors.buttonColor
        heightValue.textColor = AppColors.buttonColor
        weightValue.textColor = AppColors.buttonColor
        goalValue.textColor = AppColors.buttonColor
        slider1.thumbTintColor = AppColors.buttonColor
        slider1.tintColor = AppColors.buttonColor
        slider2.thumbTintColor = AppColors.buttonColor
        slider2.tintColor = AppColors.buttonColor
        slider3.thumbTintColor = AppColors.buttonColor
        slider3.tintColor = AppColors.buttonColor
        slider4.thumbTintColor = AppColors.buttonColor
        slider4.tintColor = AppColors.buttonColor
        // Changing the style of the first part of the head text to bold.
        let firstPart = "Before you get started, "
        let attrs = [NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 27)]
        let attributedString = NSMutableAttributedString(string:firstPart, attributes:attrs)

        let secondPart = "we would like to personalize your app for you.."
        let normalString = NSMutableAttributedString(string:secondPart)

        attributedString.append(normalString)
        HeadLabel.attributedText = attributedString
        // Adding gesture to switch image
        let tapGR = UITapGestureRecognizer(target: self, action: #selector(self.imageTapped))
        unitSwitch.addGestureRecognizer(tapGR)
        unitSwitch.isUserInteractionEnabled = true
    }
    
    @IBAction func fieldIsFocused(_ sender: UITextField)
    {
        if (sender.text == "Your name")
        {
            sender.text = "";
            sender.textColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1)
        }
    }
    @objc func imageTapped(sender: UITapGestureRecognizer)
    {
        if sender.state == .ended
        {
            if unitSwitch.image == switchOffImg
            {
                unitSwitch.image = switchOnImg
            }
            else
            {
                unitSwitch.image = switchOffImg
            }
        }
    }
//    @IBAction func changeLanguage(sender: AnyObject) {
//        guard let button = sender as? UIButton else {
//            return
//        }
//
//        switch button.tag {
//        case 1:
//            // Change to English
//        case 2:
//            // Change to Spanish
//        case 3:
//            // Change to French, etc
//        default:
//            print("Unknown language")
//            return
//        }
//    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
