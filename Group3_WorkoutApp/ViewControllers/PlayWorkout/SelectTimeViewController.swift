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
    
    
    // variables
    var hour:Int = 0
    var minutes:Int = 0
    var seconds:Int = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // apply default styling
        Constants.buildRoundedUIView(headerView: headerView, bodyView: bodyView, button:startButton)
        
        pickerView.delegate = self
    }
    
    // update total time label
    func updateTotalTime(){
        totalTimeLabel.text = "\(hour):\(minutes):\(seconds)"
    }
    
    
    @IBAction func startButtonPressed(_ sender: Any) {
        
        guard let timerView = storyboard?.instantiateViewController(identifier: "warmupView") as? TimerViewController else {return}
        let totalSeconds = (hour * 3600 ) + (minutes * 60) + seconds
        timerView.timeRemaining = TimeInterval(totalSeconds)
        present(timerView, animated: true)
        
        
    }
}

extension SelectTimeViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    
    // 3 sections in the picker
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 3
    }
    
    // number of rows for hours, minutes and seconds
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        switch component {
        case 0:
            return 25
        case 1, 2:
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
            return "\(row) hours"
        case 1:
            return "\(row) min"
        case 2:
            return "\(row) sec"
        default:
            return ""
        }
    }
    
    // set hour, min, and sec when scrolling through the picker
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        switch component {
        case 0:
            hour = row
        case 1:
            minutes = row
        case 2:
            seconds = row
        default:
            break;
        }
        
        updateTotalTime()
    }
}