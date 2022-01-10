//
//  SettingsViewController.swift
//  Group3_WorkoutApp
//
//  Created by Albaraa Mohammed Janahi  on 10/01/2022.
//

import UIKit

class SettingsViewController: UIViewController {
    
    var switchOnImg: UIImage = UIImage(named: "switch_on.svg")!
    var switchOffImg: UIImage = UIImage(named: "switch_off.svg")!
    var isPoundFeet = false
    
    let userDefaults = UserDefaults()

    @IBOutlet weak var headView1: UIView!
    @IBOutlet weak var saveButton: UIButton!
    @IBOutlet weak var slider1: UISlider!
    @IBOutlet weak var slider2: UISlider!
    @IBOutlet weak var slider3: UISlider!
    @IBOutlet weak var heightValue: UILabel!
    @IBOutlet weak var weightValue: UILabel!
    @IBOutlet weak var goalValue: UILabel!
    @IBOutlet weak var heightTxt: UILabel!
    @IBOutlet weak var weightTxt: UILabel!
    @IBOutlet weak var goalTxt: UILabel!
    @IBOutlet weak var settingsView: UIView!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var headLabel: UILabel!
    @IBOutlet weak var nameField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Setting the default styles to the page elements by calling a funcation from Constants struct.
        Constants.applyDefaultStyling(backgroundView: view, headerView: headView1, bodyView: settingsView, mainButton: saveButton, secondaryButton: nil)
        scrollView.backgroundColor = AppColors.phoneBg
        
        // Changing colors to match the app theme by calling AppColors stuct.
        headLabel.textColor = AppColors.textColor
        nameField.textColor = AppColors.phoneBg
        heightTxt.textColor = AppColors.textColor
        weightTxt.textColor = AppColors.textColor
        goalTxt.textColor = AppColors.textColor
        heightValue.textColor = AppColors.buttonColor
        weightValue.textColor = AppColors.buttonColor
        goalValue.textColor = AppColors.buttonColor
        slider1.thumbTintColor = AppColors.buttonColor
        slider1.tintColor = AppColors.buttonColor
        slider2.thumbTintColor = AppColors.buttonColor
        slider2.tintColor = AppColors.buttonColor
        slider3.thumbTintColor = AppColors.buttonColor
        slider3.tintColor = AppColors.buttonColor
        
        
        //Checking if name key is not nil, if it is not it means that the user did the quiz so we will retrieve the data.
        if let usrName = userDefaults.value(forKey: "name") as? String
        {
            nameField.text = usrName
            nameField.textColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1)
            isPoundFeet = userDefaults.value(forKey: "isPound") as! Bool
            let usrHeight = userDefaults.value(forKey: "height") as! Int
            let usrWeight = userDefaults.value(forKey: "weight") as! Int
            let usrGoal = userDefaults.value(forKey: "goal") as! Int
            let heightInFloat = Float(usrHeight)
            let weightInFloat = Float(usrWeight)
            let goalInFloat = Float(usrGoal)
            slider1.value = heightInFloat
            slider2.value = weightInFloat
            slider3.value = goalInFloat
        }
        else
        {
            //If the code reached here it means there is no data saved, the user skipped the quiz so we will set the defualt values.
            slider1.value = 175
            slider2.value = 120
            slider3.value = 120
        }
        heightValue.text = getHeight()
        weightValue.text = getWeight()
        goalValue.text = getGoal()
    }
    @IBAction func sliderMoved(_ sender: UISlider)
    {
        //Checking which slider is moved.
        switch sender.tag {
        case 1:
            heightValue.text = getHeight()
        case 2:
            weightValue.text = getWeight()
        case 3:
            goalValue.text = getGoal()
        default:
            return;
        }
    }
    
    func getHeight() -> String
    {
        var height: String
        if (!isPoundFeet)
        {
            height = String(Int(slider1.value))
            height += " cm"
        }
        else
        {
            let roundedInFoot = round((slider1.value / 30.48) * 10) / 10.0
            height = String(roundedInFoot)
            height += " Foot"
        }
        
        return height
    }
    func getWeight() -> String
    {
        var weight: String
        if (!isPoundFeet)
        {
            weight = String(Int(slider2.value))
            weight += " Kg"
        }
        else
        {
            weight = String(Int(slider2.value * 2.205))
            weight += " lbs"
        }
        return weight
    }
    func getGoal() -> String {
        var goal: String
        if (!isPoundFeet)
        {
            goal = String(Int(slider3.value))
            goal += " Kg"
        }
        else
        {
            goal = String(Int(slider3.value * 2.205))
            goal += " lbs"
        }
        return goal
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
