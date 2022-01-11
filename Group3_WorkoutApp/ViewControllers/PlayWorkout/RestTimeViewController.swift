//
//  RestTimeViewController.swift
//  Group3_WorkoutApp
//
//  Created by Ali Alqallaf on 02/01/2022.
//

import UIKit

class RestTimeViewController: UIViewController {

    // outlets
    @IBOutlet weak var bodyView: UIView!
    @IBOutlet weak var pickerView: UIPickerView!
    @IBOutlet weak var restTimeLabel: UILabel!
    @IBOutlet weak var exitButton: UIButton!
    @IBOutlet weak var confirmButton: UIButton!
    @IBOutlet weak var bodyTitleLabel: UILabel!
    
    var minutes:Int = 0
    var seconds:Int = 0
    var totalSeconds = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        pickerView.delegate = self
        
        enableStartButton()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        // apply default styling
        Constants.applyDefaultStyling(backgroundView: view, headerView: nil, bodyView: bodyView, mainButton: confirmButton, secondaryButton: nil, vc: self)
        Constants.applyTableAndTextStyling(titleLabels: [restTimeLabel], bodyLabels: [bodyTitleLabel], tableView: nil)
        pickerView.setValue(AppColors.textColor, forKey: "textColor")
    }
    
    // update total time label
    func updateTotalTime(){
        // format time
        totalSeconds = (minutes * 60) + seconds
        enableStartButton()
        let time = Constants.secondsToMinutesSeconds(seconds: Int(totalSeconds))
        let timeString = Constants.formatTimeString(minutes: time.0, seconds: time.1)
        // update timer label
        restTimeLabel.text = timeString
    }
    
    // enable the button only when selecting a time
    func enableStartButton()
    {
        if totalSeconds > 0 {
            confirmButton.isEnabled = true
            confirmButton.alpha = 1
        }else{
            confirmButton.isEnabled = false
            confirmButton.alpha = 0.5
        }
    }
    
    @IBAction func exitButtonTapped(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
}

extension RestTimeViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    
    // 2 sections in the picker
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 2
    }
    
    // number of rows for minutes and seconds
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        switch component {

        case 0, 1:
            return 60
        default:
            return 0
        }
    }
    
    // picker width
    func pickerView(_ pickerView: UIPickerView, widthForComponent component: Int) -> CGFloat {
        return pickerView.frame.size.width/3
    }
    
    // picker labels
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        switch component {
        case 0:
            return "\(row) min"
        case 1:
            return "\(row) sec"
        default:
            return ""
        }
    }
    
    // set min, and sec when scrolling through the picker
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        switch component {
       
        case 0:
            minutes = row
        case 1:
            seconds = row
        default:
            break;
        }
        updateTotalTime()
    }

}
