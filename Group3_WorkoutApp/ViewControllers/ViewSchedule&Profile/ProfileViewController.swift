//
//  ProfileViewController.swift
//  Group3_WorkoutApp
//
//  Created by mobileProg on 10/01/2022.
//

import UIKit

// Used to replace part of the text to blue color
// Takes the full string value and the text that needs to be changed as parameters
extension UILabel {
    func halfTextColorChange (fullText : String , changeText : String ) {
        let strNumber: NSString = fullText as NSString
        let range = (strNumber).range(of: changeText)
        let attribute = NSMutableAttributedString.init(string: fullText)
        attribute.addAttribute(NSAttributedString.Key.foregroundColor, value: AppColors.buttonColor , range: range)
        self.attributedText = attribute
    }
}

class ProfileViewController: UIViewController {
    
    // MARK: - OUTLETS
    
    @IBOutlet weak var profileName: UILabel!
    @IBOutlet weak var profileDoB: UILabel!
    @IBOutlet weak var heightLbl: UILabel!
    @IBOutlet weak var weightLbl: UILabel!
    @IBOutlet weak var goalLbl: UILabel!
    @IBOutlet weak var segmentCtrl: UISegmentedControl!
    @IBOutlet weak var segmentLbl1: UILabel!
    @IBOutlet weak var segmentLbl2: UILabel!
    @IBOutlet weak var segmentLbl3: UILabel!
    
    @IBOutlet weak var topSectionView: UIView!
    @IBOutlet weak var bottomSectionView: UIView!
    
    @IBOutlet var backgroundView: UIView!
    @IBOutlet weak var headerView: UIView!
    @IBOutlet weak var bodyView: UIView!
    
    // MARK: END
    
    
    // MARK: - DEFAULT VALUES
    
    private var heightUnit = "cm" // default
    private var weightUnit = "kg" // default
    private var height: Double = 0.0 // default
    private var weight: Double = 0.0 // default
    private var goal: Double = 0.0   // default
    
    // MARK: END
    
    
    // MARK: - SCREEN LOADING FUNCTIONS
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        refreshData()
        updateSegmentView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        Constants.applyDefaultStyling(backgroundView: backgroundView, headerView: headerView, bodyView: bodyView, mainButton: nil, secondaryButton: nil)
        
        // Set all font colors & sizes appropriately
        
        profileName.textColor = AppColors.textColor
        profileDoB.textColor = AppColors.textColor
        heightLbl.textColor = AppColors.textColor
        weightLbl.textColor = AppColors.textColor
        goalLbl.textColor = AppColors.textColor
        
        let selectedSegmentFontColor = [NSAttributedString.Key.foregroundColor: AppColors.phoneBg]
        let unselectedSegmentFontColor = [NSAttributedString.Key.foregroundColor: AppColors.textColor]
        segmentCtrl.setTitleTextAttributes(selectedSegmentFontColor, for: .selected)
        segmentCtrl.setTitleTextAttributes(unselectedSegmentFontColor, for: .normal)
        segmentCtrl.selectedSegmentTintColor = AppColors.buttonColor
        segmentCtrl.setTitleTextAttributes([NSAttributedString.Key.font: UIFont.systemFont(ofSize: 20)], for: .normal)
        
        segmentLbl1.textColor = AppColors.textColor
        segmentLbl2.textColor = AppColors.textColor
        segmentLbl3.textColor = AppColors.textColor
        
        // Rounded borders goes brr...
        
        topSectionView.layer.borderWidth = 1
        topSectionView.layer.borderColor = AppColors.textColor.cgColor
        topSectionView.layer.cornerRadius = 10
        
        segmentCtrl.layer.borderColor = AppColors.textColor.cgColor
        segmentCtrl.layer.borderWidth = 0.5
        segmentCtrl.layer.cornerRadius = 10
        
        bottomSectionView.layer.borderWidth = 1
        bottomSectionView.layer.borderColor = AppColors.textColor.cgColor
        bottomSectionView.layer.cornerRadius = 10
                
        // BOTTOM VIEW SECTION
        segmentLbl1.halfTextColorChange(fullText: segmentLbl1.text!, changeText: "0 min")
        segmentLbl2.halfTextColorChange(fullText: segmentLbl2.text!, changeText: "0 min")
        segmentLbl3.halfTextColorChange(fullText: segmentLbl3.text!, changeText: "0 min")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        refreshData()
    }
    
    // MARK: END
    
    
    // MARK: - BUTTON ACTIONS
    
    @IBAction func segmentUpdated(_ sender: UISegmentedControl) {
        updateSegmentView()
    }
    
    // MARK: END
    
    
    // MARK: - CUSTOM FUNCTIONS
    
    func updateSegmentView() {
        if segmentCtrl.selectedSegmentIndex == 0 {
            
            segmentLbl1.text = "Time Worked Out: 0 min"
            segmentLbl2.text = "Cardio Time: 0 min"
            segmentLbl3.text = "Total Time: 0 min"
            
        } else if segmentCtrl.selectedSegmentIndex == 1 {
            
            segmentLbl1.text = "Average Time Worked Out: 0 min"
            segmentLbl2.text = "Average Cardio Time: 0 min"
            segmentLbl3.text = "Total Days Worked Out: 0 days"
            
        } else {
            
            segmentLbl1.text = "Total Days Worked Out: 0 days"
            segmentLbl2.text = "Total Cardio Time: 0 min"
            segmentLbl3.text = "Streak: 0 days (longest: 0 days)"
        }
        
        segmentLbl1.halfTextColorChange(fullText: segmentLbl1.text!, changeText: getProfileStatsString(segmentLbl1.text!))
        segmentLbl2.halfTextColorChange(fullText: segmentLbl2.text!, changeText: getProfileStatsString(segmentLbl2.text!))
        segmentLbl3.halfTextColorChange(fullText: segmentLbl3.text!, changeText: getProfileStatsString(segmentLbl3.text!))
    }
    
    // Passes the characters after the colon so that it can be used to change their color to blue
    func getProfileStatsString(_ text: String) -> String {
        let pattern: String = "(?<=: ).*" // pattern to get all text after the colon and the space characters
        return match(text, pattern)[0]
    }
        
    // Returns an array of regex matches by using the pattern passed [used by "getProfileStatsString()"]
    func match(_ text: String, _ pattern: String) -> [String] {
        do {
            let pattern = try NSRegularExpression(pattern: pattern)
            let results = pattern.matches(in: text, range: NSRange(text.startIndex..., in: text))
            
            return results.map { String(text[Range($0.range, in: text)!]) }
            
        } catch let error {
            print("invalid regex pattern \(error.localizedDescription)")
            return []
        }
    }
    
    // Updates the unit system during profile screen load
    func setUnitSystem(_ isImperialUnit: Bool) {
        if isImperialUnit == true {
            self.setHeightUnit("ft")
            self.setWeightUnit("lbs")
        } else {
            self.setHeightUnit("cm")
            self.setWeightUnit("kg")
        }
    }
    
    // Convert height, weight & goal from UK system to US system
    func convertData(_ isImperialUnit: Bool, _ height: Double, _ weight: Double, _ goal: Double) {
        if isImperialUnit == true {
            self.setHeight(round((height / 30.48) * 10) / 10.0)
            self.setWeight(round((weight * 2.205) * 10) / 10.0)
            self.setGoal(round((goal * 2.205) * 10) / 10.0)
            
        } else {
            self.setHeight(height)
            self.setWeight(weight)
            self.setGoal(goal)
        }
    }
    
    // Change the important text to blue to grab attention
    // Read the top of file to know more about the function [halfTextColorChange] used
    func refreshData() {
        // Get data to check whether the user has skipped the first-run page or not
        // Gets the data if found otherwise it will use the default values
        let dict = UserDefaults.standard
        let age = dict.object(forKey: "age") as? Int ?? 0
        let dictHeight = dict.object(forKey: "height") as? Double ?? 0.0
        let dictWeight = dict.object(forKey: "weight") as? Double ?? 0.0
        let name = dict.object(forKey: "name") as? String ?? "Update name in settings"
        let dictGoal = dict.object(forKey: "goal") as? Double ?? 0.0
        let isImperialUnits = dict.object(forKey: "isPound") as? Bool ?? false
        
        setUnitSystem(isImperialUnits)
        convertData(isImperialUnits, dictHeight, dictWeight, dictGoal)
        
        print("== USER PREFERENCES ==")
        print("name = \(name)")
        print("age = \(age)")
        print("height = \(height)")
        print("weight = \(weight)")
        print("goal = \(goal)")
        print("US units = \(isImperialUnits) (\(heightUnit), \(weightUnit))")
        print("================")
        
        // HEADER VIEW
        profileName.text = name
        profileDoB.text = "\(age) Years Old"
        
        // TOP VIEW SECTION
        
        // Set label text
        heightLbl.text = "Height: \(height) \(heightUnit)"
        weightLbl.text = "Weight: \(weight) \(weightUnit)"
        goalLbl.text = "Goal: \(goal) \(weightUnit)"
        
        // Color the important information in blue
        heightLbl.halfTextColorChange(fullText: heightLbl.text!, changeText: "\(height) \(heightUnit)")
        weightLbl.halfTextColorChange(fullText: weightLbl.text!, changeText: "\(weight) \(weightUnit)")
        goalLbl.halfTextColorChange(fullText: goalLbl.text!, changeText: "\(goal) \(weightUnit)")
    }
    
    // MARK: END
    
    
    // MARK: - GETTERS AND SETTERS
    
    // MARK: Getters
    func getHeightUnit() -> String {
        return self.heightUnit
    }
    
    func getWeightUnit() -> String {
        return self.weightUnit
    }
    
    func getHeight() -> Double {
        return self.height
    }
    
    func getWeight() -> Double {
        return self.weight
    }
    
    func getGoal() -> Double {
        return self.goal
    }
    
    // MARK: Setters
    func setHeightUnit(_ unit: String) {
        self.heightUnit = unit
    }
    
    func setWeightUnit(_ unit: String) {
        self.weightUnit = unit
    }
    
    func setHeight(_ height: Double) {
        self.height = height
    }
    
    func setWeight(_ weight: Double) {
        self.weight = weight
    }
    
    func setGoal(_ goal: Double) {
        self.goal = goal
    }
    
    // MARK: END
}
