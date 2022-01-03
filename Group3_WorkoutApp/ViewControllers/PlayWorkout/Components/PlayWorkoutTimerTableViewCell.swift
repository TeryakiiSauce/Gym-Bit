//
//  PlayWorkoutTimerTableViewCell.swift
//  Group3_WorkoutApp
//
//  Created by Ali Alqallaf on 03/01/2022.
//

import UIKit

class PlayWorkoutTimerTableViewCell: UITableViewCell {
    
    @IBOutlet weak var cellView: UIView!
    @IBOutlet weak var playImage: UIImageView!
    @IBOutlet weak var timeRemainingLabel: UILabel!
    var timer = Timer()
    //default selected time
    var selectedTime: Double = 45
    var timeRemaining: Double = 45
    var timerIsCounting: Bool = false
    var timerStarted = false
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        cellView.layer.cornerRadius = Constants.viewRadius
        cellView.layer.borderColor = AppColors.secondaryColor.cgColor
        cellView.layer.borderWidth = 1
        selectionStyle = .none
        
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(imageTapped(tapGestureRecognizer:)))
        playImage.isUserInteractionEnabled = true
        playImage.addGestureRecognizer(tapGestureRecognizer)
    }
    
    @objc func imageTapped(tapGestureRecognizer: UITapGestureRecognizer)
    {
        timerIsCounting = true
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(updateTime), userInfo: nil, repeats: true)
        playImage.image = UIImage(named: "unchecked_box")
        playImage.isUserInteractionEnabled = false
    }
    
    
    
    func formatTimeRemaining()
    {
        
        let time = Constants.secondsToHoursMinutesSeconds(seconds: Int(timeRemaining))
        let timeString = Constants.formatTimeString(hours: time.0, minutes: time.1, seconds: time.2)
        // update timer label
        timeRemainingLabel.text = timeString
    }
    
    
    @objc func updateTime() {
        
        if timeRemaining > 0 {
            // subtract 1 second from the time remaining
            timeRemaining -= 1
        } else {
            // reset time remaining
            self.timeRemaining = selectedTime
            // stop time
            timer.invalidate()
            // display checked button button
            playImage.image = UIImage(named: "checked_box")
        }
        // format time remaining
        formatTimeRemaining()
    }
}
