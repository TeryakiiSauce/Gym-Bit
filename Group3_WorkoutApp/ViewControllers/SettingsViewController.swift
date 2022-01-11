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

    @IBOutlet weak var backView: UIView!
    @IBOutlet weak var headView1: UIView!
    @IBOutlet weak var saveButton: UIButton!
    @IBOutlet weak var slider1: UISlider!
    @IBOutlet weak var slider2: UISlider!
    @IBOutlet weak var slider3: UISlider!
    @IBOutlet weak var slider4: UISlider!
    @IBOutlet weak var yearsValue: UILabel!
    @IBOutlet weak var heightValue: UILabel!
    @IBOutlet weak var weightValue: UILabel!
    @IBOutlet weak var goalValue: UILabel!
    @IBOutlet weak var ageTxt: UILabel!
    @IBOutlet weak var heightTxt: UILabel!
    @IBOutlet weak var weightTxt: UILabel!
    @IBOutlet weak var goalTxt: UILabel!
    @IBOutlet weak var settingsView: UIView!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var headLabel: UILabel!
    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var headView2: UIView!
    @IBOutlet weak var appSettingsLabel: UILabel!
    @IBOutlet weak var settingsView2: UIView!
    @IBOutlet weak var timeSoundTxt: UILabel!
    @IBOutlet weak var darkModeTxt: UILabel!
    @IBOutlet weak var unitTxt: UILabel!
    @IBOutlet weak var soundSwitch: UIImageView!
    @IBOutlet weak var darkModeSwitch: UIImageView!
    @IBOutlet weak var unitSwitch: UIImageView!
    @IBOutlet weak var line1: UILabel!
    @IBOutlet weak var line2: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Setting the default styles to the page elements by calling a funcation from Constants struct.
        Constants.applyDefaultStyling(backgroundView: view, headerView: headView1, bodyView: settingsView, mainButton: saveButton, secondaryButton: nil)
        Constants.buildRoundedUIView(headerView: headView2, bodyView: settingsView2, button: nil)
        scrollView.backgroundColor = AppColors.phoneBg
        backView.backgroundColor = AppColors.phoneBg
        
        // Changing view 1 elements colors to match the app theme by calling AppColors stuct.
        headLabel.textColor = AppColors.textColor
        nameField.textColor = AppColors.phoneBg
        ageTxt.textColor = AppColors.textColor
        heightTxt.textColor = AppColors.textColor
        weightTxt.textColor = AppColors.textColor
        goalTxt.textColor = AppColors.textColor
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
        
        // Changing view 2 elements colors to match the app theme by calling AppColors stuct.
        timeSoundTxt.textColor = AppColors.textColor
        darkModeTxt.textColor = AppColors.textColor
        unitTxt.textColor = AppColors.textColor
        line1.textColor = AppColors.phoneBg
        line2.textColor = AppColors.phoneBg
        //Checking if name key is not nil, if it is not it means that the user did the quiz so we will retrieve the data.
        if let usrName = userDefaults.value(forKey: "name") as? String
        {
            nameField.text = usrName
            nameField.textColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1)
            isPoundFeet = userDefaults.value(forKey: "isPound") as! Bool
            let usrAge = userDefaults.value(forKey: "age") as! Int
            let usrHeight = userDefaults.value(forKey: "height") as! Int
            let usrWeight = userDefaults.value(forKey: "weight") as! Int
            let usrGoal = userDefaults.value(forKey: "goal") as! Int
            let ageInFloat = Float(usrAge)
            let heightInFloat = Float(usrHeight)
            let weightInFloat = Float(usrWeight)
            let goalInFloat = Float(usrGoal)
            slider1.value = ageInFloat
            slider2.value = heightInFloat
            slider3.value = weightInFloat
            slider4.value = goalInFloat
        }
        else
        {
            //If the code reached here it means there is no data saved, the user skipped the quiz so we will set the defualt values.
            slider1.value = 47.5
            slider2.value = 175
            slider3.value = 120
            slider4.value = 120
        }
        //Assiging labels to the actual value
        yearsValue.text = getYears()
        heightValue.text = getHeight()
        weightValue.text = getWeight()
        goalValue.text = getGoal()
        
        // Adding gesture to switches images
        let soundSwitchtapGR = UITapGestureRecognizer(target: self, action: #selector(self.soundSwitchTapped))
        soundSwitch.addGestureRecognizer(soundSwitchtapGR)
        soundSwitch.isUserInteractionEnabled = true
        let darkModeSwitchtapGR = UITapGestureRecognizer(target: self, action: #selector(self.darkModeSwitchTapped))
        darkModeSwitch.addGestureRecognizer(darkModeSwitchtapGR)
        darkModeSwitch.isUserInteractionEnabled = true
        let unitSwitchtapGR = UITapGestureRecognizer(target: self, action: #selector(self.unitSwitchTapped))
        unitSwitch.addGestureRecognizer(unitSwitchtapGR)
        unitSwitch.isUserInteractionEnabled = true
        
    }
    
    //Check if field editted, for first time it will be "your name" so we will remove it and change the color of the text.
    @IBAction func fieldEditted(_ sender: UITextField)
    {
        if (sender.text == "Your name")
        {
            sender.text = "";
            sender.textColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1)
        }
    }
    
    //Changing the text after any of the slides moved.
    @IBAction func sliderMoved(_ sender: UISlider)
    {
        //Checking which slider is moved.
        switch sender.tag {
        case 1:
            yearsValue.text = getYears()
        case 2:
            heightValue.text = getHeight()
        case 3:
            weightValue.text = getWeight()
        case 4:
            goalValue.text = getGoal()
        default:
            return;
        }
    }
    //if sound switch clicked this function will change its image, set sounds to off by calling isSoundOn variable and save in userdata if the switch is on or off.
    @objc func soundSwitchTapped(sender: UITapGestureRecognizer)
    {
        if sender.state == .ended
        {
            if soundSwitch.image == switchOffImg
            {
                soundSwitch.image = switchOnImg
                Constants.isSoundOn = true
            }
            else
            {
                soundSwitch.image = switchOnImg
                Constants.isSoundOn = false
            }
            userDefaults.setValue(Constants.isSoundOn, forKey: "sound")
        }
    }
    
    //if dark mode switch clicked this function will change its image, set colors to dark mode by calling isDarkMode variable and save in userdata if the switch is on or off.
    @objc func darkModeSwitchTapped(sender: UITapGestureRecognizer)
    {
        if sender.state == .ended
        {
            if darkModeSwitch.image == switchOffImg
            {
                darkModeSwitch.image = switchOnImg
                AppColors.isDarkMode = true
            }
            else
            {
                darkModeSwitch.image = switchOnImg
                AppColors.isDarkMode = false
            }
            userDefaults.setValue(AppColors.isDarkMode, forKey: "darkMode")
        }
    }
    
    //if unit switch clicked this function will change its image, update the labels and save in userdata if the switch is on or off.
    @objc func unitSwitchTapped(sender: UITapGestureRecognizer)
    {
        if sender.state == .ended
        {
            if unitSwitch.image == switchOffImg
            {
                unitSwitch.image = switchOnImg
                unitTxt.text = "Unit (Foot/lbs)"
                isPoundFeet = true
            }
            else
            {
                unitSwitch.image = switchOffImg
                unitTxt.text = "Unit (cm/Kg)"
                isPoundFeet = false;
            }
            userDefaults.setValue(isPoundFeet, forKey: "isPound")
            heightValue.text = getHeight()
            weightValue.text = getWeight()
            goalValue.text = getGoal()
        }
    }
    
    func getYears() -> String
    {
        var years: String
        years = String(Int(slider1.value))
        years += " years"
        return years
    }
    func getHeight() -> String
    {
        var height: String
        if (!isPoundFeet)
        {
            height = String(Int(slider2.value))
            height += " cm"
        }
        else
        {
            let roundedInFoot = round((slider2.value / 30.48) * 10) / 10.0
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
            weight = String(Int(slider3.value))
            weight += " Kg"
        }
        else
        {
            weight = String(Int(slider3.value * 2.205))
            weight += " lbs"
        }
        return weight
    }
    func getGoal() -> String {
        var goal: String
        if (!isPoundFeet)
        {
            goal = String(Int(slider4.value))
            goal += " Kg"
        }
        else
        {
            goal = String(Int(slider4.value * 2.205))
            goal += " lbs"
        }
        return goal
    }

    @IBAction func saveClicked(_ sender: Any)
    {
        if (nameField.text == "Your name" || nameField.text == "")
        {
            Constants.displayAlert(thisClass: self, alertTitle: "Alert", msg: "Please enter your name!", printInConsole: nil)
            return
        }
        
        //validating if very short name or only spaces.
        var name = nameField.text!
        name = name.trimmingCharacters(in: .whitespaces)
        if(name == "")
        {
            Constants.displayAlert(thisClass: self, alertTitle: "Alert", msg: "Please enter your name!", printInConsole: nil)
            return
        }
        if(name.count < 3)
        {
            Constants.displayAlert(thisClass: self, alertTitle: "Alert", msg: "Your name should be at least three letters", printInConsole: nil)
            return
        }
        
        //validating if name contain any number or special charecter, also counting spaces if more than one.
        var numOfSpaces = 0
        for l in name
        {
            if (!l.isLetter)
            {
                if(!l.isWhitespace)
                {
                    Constants.displayAlert(thisClass: self, alertTitle: "Alert", msg: "Your name can contain only letters and a white space", printInConsole: nil)
                    return
                }
                else
                {
                    numOfSpaces += 1
                }
            }
        }
        if numOfSpaces > 1
        {
            Constants.displayAlert(thisClass: self, alertTitle: "Alert", msg: "The name text field can contain only one white space (between first and last name)", printInConsole: nil)
            return
        }
        
        //Since the code reached hear it means that the input passed all the validations.
        if userDefaults.value(forKey: "isPound") == nil
        {
            //if user did not chose if it is pound unit or not, it means that is his first time saving the data, he did not do the quiz so we set it to false to encounter any errors may occur while force wrapping this value in any other class.
            userDefaults.setValue(false, forKey: "isPound")
        }
        //Saving the data to retrieve it later.
        let age = Int(slider1.value)
        let height = Int(slider2.value)
        let weight = Int(slider3.value)
        let goal = Int(slider4.value)
        userDefaults.setValue(name, forKey: "name")
        userDefaults.setValue(age, forKey: "age")
        userDefaults.setValue(height, forKey: "height")
        userDefaults.setValue(weight, forKey: "weight")
        userDefaults.setValue(goal, forKey: "goal")
        Constants.displayAlert(thisClass: self, alertTitle: "Done", msg: "Your data updated successfully", printInConsole: nil)
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
