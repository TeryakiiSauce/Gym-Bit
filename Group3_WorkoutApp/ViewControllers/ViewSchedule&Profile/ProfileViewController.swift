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
    
    @IBOutlet weak var profileName: UILabel!
    @IBOutlet weak var profileDoB: UILabel!
    @IBOutlet weak var heightLbl: UILabel!
    @IBOutlet weak var weightLbl: UILabel!
    @IBOutlet weak var goalLbl: UILabel!
    @IBOutlet weak var lastWorkoutLbl: UILabel!
    @IBOutlet weak var segmentCtrl: UISegmentedControl!
    @IBOutlet weak var segmentLbl1: UILabel!
    @IBOutlet weak var segmentLbl2: UILabel!
    @IBOutlet weak var segmentLbl3: UILabel!
    
    @IBOutlet weak var topSectionView: UIView!
    @IBOutlet weak var bottomSectionView: UIView!
    
    @IBOutlet var backgroundView: UIView!
    @IBOutlet weak var headerView: UIView!
    @IBOutlet weak var bodyView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        Constants.applyDefaultStyling(backgroundView: backgroundView, headerView: headerView, bodyView: bodyView, mainButton: nil, secondaryButton: nil)
        
        // Set all font colors & sizes appropriately
                
        heightLbl.textColor = AppColors.textColor
        weightLbl.textColor = AppColors.textColor
        goalLbl.textColor = AppColors.textColor
        lastWorkoutLbl.textColor = AppColors.textColor
        
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
        
        // Change the important text to blue to grab attention
        // TODO: if json is not empty then load prev data otherwise set the below as default
        // read top of file to know more about the function used
        heightLbl.halfTextColorChange(fullText: heightLbl.text!, changeText: "0 cm")
        weightLbl.halfTextColorChange(fullText: weightLbl.text!, changeText: "0 kg")
        goalLbl.halfTextColorChange(fullText: goalLbl.text!, changeText: "0 kg")
        lastWorkoutLbl.halfTextColorChange(fullText: lastWorkoutLbl.text!, changeText: "0 kg")
        
        segmentLbl1.halfTextColorChange(fullText: segmentLbl1.text!, changeText: "0 min")
        segmentLbl2.halfTextColorChange(fullText: segmentLbl2.text!, changeText: "0 min")
        segmentLbl3.halfTextColorChange(fullText: segmentLbl3.text!, changeText: "0 min")
        
        updateSegmentView()
    }
    
    @IBAction func segmentUpdated(_ sender: UISegmentedControl) {
        updateSegmentView()
    }
    
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
        
    // Used for getting an array of regex matches by using the pattern passed
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
    
    /*
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
