//
//  PlayWorkoutTimerTableViewCell.swift
//  Group3_WorkoutApp
//
//  Created by Ali Alqallaf on 03/01/2022.
//

import UIKit

protocol TimerCellDelegate: AnyObject {
    func timerButtonTapped()
}

class PlayWorkoutTimerTableViewCell: UITableViewCell {
    
    weak var delegate: TimerCellDelegate?
    
    // outlets
    @IBOutlet weak var cellView: UIView!
    @IBOutlet weak var playImage: UIImageView!
    @IBOutlet weak var timeRemainingLabel: UILabel!
    @IBOutlet weak var cellTitle: UILabel!
    
    var timer = Timer()
    //default selected time
    let selectedTime: Int = PlayWorkoutLandingViewController.restTime
    var timeRemaining: Int = 45
    var isCompleted = false
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // view and cell styling
        cellView.layer.cornerRadius = Constants.viewRadius
        cellView.layer.borderColor = AppColors.secondaryColor.cgColor
        cellView.layer.borderWidth = 1
        backgroundColor = AppColors.bodyBg
        cellView.backgroundColor = AppColors.bodyBg
        timeRemainingLabel.textColor = AppColors.textColor
        cellTitle.textColor = AppColors.textColor
        cellTitle.textColor = AppColors.textColor
        selectionStyle = .none
        
        // add gesture to the play button image
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(imageTapped(tapGestureRecognizer:)))
        playImage.isUserInteractionEnabled = true
        playImage.addGestureRecognizer(tapGestureRecognizer)
        
        // set default timing and format it
        timeRemaining = selectedTime
        formatTimeRemaining()
    }
    
    // play the rest timer
    @objc func imageTapped(tapGestureRecognizer: UITapGestureRecognizer)
    {
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(updateTime), userInfo: nil, repeats: true)
        playImage.image = UIImage(named: "unchecked_box")
        playImage.isUserInteractionEnabled = false
       
    }
    
    // format the time
    func formatTimeRemaining()
    {
        let time = Constants.secondsToMinutesSeconds(seconds: Int(timeRemaining))
        let timeString = Constants.formatTimeString(minutes: time.0, seconds: time.1)
        // update timer label
        timeRemainingLabel.text = timeString
    }
    
    // update the time (every second)
    @objc func updateTime() {
        
        if timeRemaining > 0 {
            // subtract 1 second from the time remaining
            timeRemaining -= 1
        } else {
            //play alarm
            Constants.playTimerSound()
            // reset time remaining
            self.timeRemaining = selectedTime
            // stop time
            timer.invalidate()
            // display checked button button
            playImage.image = UIImage(named: "checked_box")
            // set is completed to true
            isCompleted = true
            // to update is completed of the play workout vc
            delegate?.timerButtonTapped()
        }
        // format time remaining
        formatTimeRemaining()
    }
    
    // reset the timer
    func resetCell(){
        playImage.image = UIImage(named: "play")
        // reset time remaining
        self.timeRemaining = selectedTime
        // stop time
        timer.invalidate()
        formatTimeRemaining()
        playImage.isUserInteractionEnabled = true
        isCompleted = false

    }
}
