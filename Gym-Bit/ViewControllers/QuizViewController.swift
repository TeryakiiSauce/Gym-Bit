//
//  QuizViewController.swift
//  Group3_WorkoutApp
//
//  Created by Albaraa Mohammed Janahi  on 03/01/2022.
//

import UIKit

class QuizViewController: UIViewController {
    
    var switchOnImg: UIImage = UIImage(named: "switch_on.svg")!
    var switchOffImg: UIImage = UIImage(named: "switch_off.svg")!
    var isPoundFeet = false
    
    let userDefaults = UserDefaults()

    @IBOutlet weak var skipButton: UIButton!
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
        //userDefaults.setValue(nil, forKey: "name")
        
        //Check if dark mode on, if yes switch the theme
        if let isDark = userDefaults.value(forKey: "darkMode") as? Bool
        {
            if isDark
            {
                AppColors.toggleDarkMode()
            }
        }

        //Check if sound is off, if yes turn of the sounds
        if let isSoundOn = userDefaults.value(forKey: "sound") as? Bool
        {
            if !isSoundOn
            {
                Constants.isSoundOn = false
            }
        }

        //Here we check if the user already did the quiz, if yes skip the page and move to the view schedual page
        if let usrName = userDefaults.value(forKey: "name") as? String
        {
            print(usrName)
            self.performSegue(withIdentifier: "mainIdentifier", sender: self)
        }
    }

    override func viewWillAppear(_ animated: Bool) {
        // Setting the default style to the view and the body view by calling a funcation from Constants struct.
        Constants.applyDefaultStyling(backgroundView: view, headerView: nil, bodyView: bodyView, mainButton: finishButton, secondaryButton: nil, vc: self)
        
        var txtLabels: [UILabel] = [UILabel]()
        txtLabels.append(HeadLabel)
        txtLabels.append(ageTxt)
        txtLabels.append(heightTxt)
        txtLabels.append(weightTxt)
        txtLabels.append(goalTxt)
        txtLabels.append(unitTxt)
        
        
        Constants.applyTableAndTextStyling(titleLabels: nil, bodyLabels: txtLabels, tableView: nil)
        
        
        // Changing colors to match the app theme by calling AppColors stuct.
        skipButton.tintColor = AppColors.buttonColor
        bodyView.backgroundColor = AppColors.bodyBg
        nameField.textColor = AppColors.phoneBg
        Line1.textColor = AppColors.phoneBg
        Line2.textColor = AppColors.phoneBg
        Line3.textColor = AppColors.phoneBg
        Line4.textColor = AppColors.phoneBg
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
        let fontSize = HeadLabel.font.pointSize
        let firstPart = "Before you get started, "
        let attrs = [NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: fontSize)]
        let attributedString = NSMutableAttributedString(string:firstPart, attributes:attrs)

        let secondPart = "we would like to personalize your app for you.."
        let normalString = NSMutableAttributedString(string:secondPart)

        attributedString.append(normalString)
        HeadLabel.attributedText = attributedString
        
        // Adding gesture to switch image
        let tapGR = UITapGestureRecognizer(target: self, action: #selector(self.imageTapped))
        unitSwitch.addGestureRecognizer(tapGR)
        unitSwitch.isUserInteractionEnabled = true
        
        //Set sliders and labels values
        slider1.value = 47.5
        slider2.value = 175
        slider3.value = 120
        slider4.value = 120
        yearsValue.text = getYears()
        heightValue.text = getHeight()
        weightValue.text = getWeight()
        goalValue.text = getGoal()
        
    }
    
    //removing "your name" text after field is focused so the user not need to erase it.
    @IBAction func fieldIsFocused(_ sender: UITextField)
    {
        if (sender.text == "Your name")
        {
            sender.text = "";
            sender.textColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1)
        }
    }
    
    //after switch is clicked the image and units changed.
    @objc func imageTapped(sender: UITapGestureRecognizer)
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
            heightValue.text = getHeight()
            weightValue.text = getWeight()
            goalValue.text = getGoal()
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
    
    //these functions goal is converting sliders values to strings in order to be used in labels.
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
    
    //action of the finish button, this function will be responsible to validate the name and moving to the next screen.
    @IBAction func finishClicked(_ sender: Any)
    {
        //Checking if the user did not entered his name.
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
        userDefaults.setValue(isPoundFeet, forKey: "isPound")
        print("Saved :)")
        
        //preform segue to view Schedule page
        self.performSegue(withIdentifier: "mainIdentifier", sender: self)
    }
    
    @IBAction func skipClicked(_ sender: Any)
    {
        //preform segue to view Schedule page
        self.performSegue(withIdentifier: "mainIdentifier", sender: self)
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
