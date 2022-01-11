//
//  SelectTimeViewController.swift
//  Group3_WorkoutApp
//
//  Created by Ali Alqallaf on 30/12/2021.
//

import UIKit

class SelectTimeViewController: UIViewController {
    
    // outlets
    @IBOutlet weak var headerView: UIView!
    @IBOutlet weak var bodyView: UIView!
    @IBOutlet weak var startButton: UIButton!
    @IBOutlet weak var pickerView: UIPickerView!
    @IBOutlet weak var totalTimeLabel: UILabel!
    @IBOutlet weak var headerTitleLabel: UILabel!
    @IBOutlet weak var headerSubtitleLabel: UILabel!
    @IBOutlet weak var bodyTitleLabel: UILabel!
    
    // variables
    //    var hour:Int = 0
    var minutes:Int = 0
    var seconds:Int = 0
    var totalSeconds = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        pickerView.delegate = self
        //disable start button by default
        enableStartButton()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        // apply default styling
        Constants.applyDefaultStyling(backgroundView: view, headerView: headerView, bodyView: bodyView, mainButton: startButton, secondaryButton: nil, vc: self)
        
        Constants.applyTableAndTextStyling(titleLabels: [totalTimeLabel, headerTitleLabel], bodyLabels: [bodyTitleLabel, headerSubtitleLabel], tableView: nil)
        
        pickerView.setValue(AppColors.textColor, forKey: "textColor")

        
    }
    
    func enableStartButton()
    {
        if totalSeconds > 0 {
            startButton.isEnabled = true
            startButton.alpha = 1
        }else{
            startButton.isEnabled = false
            startButton.alpha = 0.5
        }
    }
    
    // update total time label
    func updateTotalTime(){
        // format time
        totalSeconds = (minutes * 60) + seconds
        enableStartButton()
        let time = Constants.secondsToMinutesSeconds(seconds: Int(totalSeconds))
        let timeString = Constants.formatTimeString(minutes: time.0, seconds: time.1)
        // update timer label
        totalTimeLabel.text = timeString
    }
    
    
    @IBAction func startButtonPressed(_ sender: Any) {
        
        guard let timerVC = self.storyboard?.instantiateViewController(identifier: "warmupView") as? TimerViewController else {return}
        
        timerVC.selectedTime = Double(self.totalSeconds)
        self.show(timerVC, sender: sender)
//        self.present(timerView, animated: true)
    }
}

extension SelectTimeViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    
    // 3 sections in the picker
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 2
    }
    
    // number of rows for hours, minutes and seconds
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
    
    // set hour, min, and sec when scrolling through the picker
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
