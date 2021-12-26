//
//  TimerViewController.swift
//  Group3_WorkoutApp
//
//  Created by Ali Alqallaf on 23/12/2021.
//

import UIKit

class TimerViewController: UIViewController {

    
    @IBOutlet weak var countDownLabel: UILabel!
    @IBOutlet weak var startStopButton: UIButton!
    @IBOutlet weak var resetButton: UIButton!
    @IBOutlet weak var headerView: UIView!
    @IBOutlet weak var bodyView: UIView!
    
    var count = 10
    var timer: Timer!
    var timerCounting: Bool = false
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        // apply default styling for the views
        Constants.buildRoundedUIView(headerView: headerView, bodyView: bodyView, button:nil)
    }
    

    @IBAction func playButtonPressed(_ sender: Any) {
        if(timerCounting)
        {
            timerCounting = false
            timer.invalidate() //stops the timer
            startStopButton.setTitle("START", for: .normal)
        }else{
            timerCounting = true
            startStopButton.setTitle("STOP", for: .normal)
            
            // init timer when play button pressed
            timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(timerCounter), userInfo: nil, repeats: true)
        }
       
    }
    

    @IBAction func resetButtonPressed(_ sender: Any) {
        let alert = UIAlertController(title: "Reset Time", message: "Are you sure you would like to reset the timer?", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: {(_) in
            // do nothing
        }))
        alert.addAction(UIAlertAction(title: "Yes", style: .default, handler: {(_) in
            // do nothing
            self.count = 0
            self.timer.invalidate()
            self.countDownLabel.text = self.makeTimeString(hours: 0, minutes: 0, seconds: 0)
            self.startStopButton.setTitle("START", for: .normal)

        }))
        
        self.present(alert, animated: true, completion: nil)
        
    }
    
    @objc func timerCounter() -> Void {
        count = count + 1
        let time = secondsToHoursMinutesSeconds(seconds: count)
        let timeString = makeTimeString(hours: time.0, minutes: time.1, seconds: time.2)
        countDownLabel.text = timeString
    }
    
    // convert seconds to Hours Minutes Seconds format
    func secondsToHoursMinutesSeconds(seconds: Int) -> (Int, Int, Int)
    {
        return ((seconds / 3600), (seconds % 3600) / 60, ((seconds % 3600) % 60))
    }
    
    func makeTimeString(hours: Int, minutes: Int, seconds: Int) -> String
    {
        // format count
        var timeString = ""
        timeString += String(format: "%02d", hours)
        timeString += " : "
        timeString += String(format: "%02d", minutes)
        timeString += " : "
        timeString += String(format: "%02d", seconds)
        timeString += " : "
        
        return timeString
        
    }
    
}
