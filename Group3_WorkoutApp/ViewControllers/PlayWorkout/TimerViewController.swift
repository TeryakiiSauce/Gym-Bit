//
//  TimerViewController.swift
//  Group3_WorkoutApp
//
//  Created by Ali Alqallaf on 23/12/2021.
//

import UIKit

// convert degrees to radians
extension Int {
    var degreesToRadians : CGFloat {
        return CGFloat(self) * .pi / 180
    }
}

class TimerViewController: UIViewController {
    
    // outlets
    @IBOutlet weak var headerView: UIView!
    @IBOutlet weak var bodyView: UIView!
    @IBOutlet weak var playPauseButton: UIButton!
    @IBOutlet weak var selectedTimeLabel: UILabel!
    @IBOutlet weak var continueButton: UIButton!
    
    // constants and variables
    // circle of the timer background
    let backgroundShape = CAShapeLayer()
    // circle to use its stroke for timer animation
    let timerShape = CAShapeLayer()
    
    // timer to calculate the remaining selected time
    var timer = Timer()
    //default selected time
    var selectedTime: Double = 300
    var timeRemaining: Double = 300
    // label to show the remaining time
    var timeLabel =  UILabel()
    // animation object to animate timer shape stroke
    let basicAnimation = CABasicAnimation(keyPath: "strokeEnd")
    // to show play or pause button
    var timerIsCounting: Bool = false
    // to add the animation on the first run only
    var firstRun = true
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // apply default styling
        Constants.applyDefaultStyling(backgroundView: view, headerView: headerView, bodyView: bodyView, mainButton: continueButton, secondaryButton: nil)

        // set time remaining as the selected time
        timeRemaining = selectedTime
        
        // draw and build elements
        drawBackroundCircle()
        drawTimerCircle()
        addTimeLabelToBackgroundCircle()
        
        // set selected time in header
        selectedTimeLabel.text = "Selected Time \(timeLabel.text!)"
        
        // define the fromValue, toValue and duration of animation
        basicAnimation.fromValue = 0
        basicAnimation.toValue = 1
        basicAnimation.duration = CFTimeInterval(timeRemaining)
        // don't remove the stroke when reaching the end
        basicAnimation.fillMode = CAMediaTimingFillMode.forwards
        basicAnimation.isRemovedOnCompletion = false
        
    }
    
    
    
    func addTimeLabelToBackgroundCircle() {
        timeLabel = UILabel(frame: CGRect(x: backgroundShape.frame.midX ,y: backgroundShape.frame.height/2, width: 100, height: 50))
        timeLabel.center = CGPoint(x:bodyView.frame.width/2, y:bodyView.frame.height/3)
        timeLabel.textAlignment = .center
        
        // format time remaining
        let time = Constants.secondsToMinutesSeconds(seconds: Int(selectedTime))
        let timeString = Constants.formatTimeString(minutes: time.0, seconds: time.1)
        
        timeLabel.text = timeString
        
        bodyView.addSubview(timeLabel)
    }
    
    func drawBackroundCircle()
    {
        // background circle position
        let position = CGPoint(x:bodyView.frame.width/2, y:bodyView.frame.height/3)
        
        // define shape path
        let circularPath = UIBezierPath(arcCenter: position, radius: 110, startAngle: -90.degreesToRadians, endAngle: 270.degreesToRadians, clockwise: true)
        
        // set circle fill
        backgroundShape.fillColor = AppColors.phoneBg.cgColor
        // assign circular path to the shape path
        backgroundShape.path = circularPath.cgPath
        // set stroke properties
        backgroundShape.strokeColor = AppColors.buttonSecondaryColor.cgColor
        backgroundShape.lineWidth = 15
        // add shape to the body view
        bodyView.layer.addSublayer(backgroundShape)
    }
    
    func drawTimerCircle() {
        // timer circle position
        let position = CGPoint(x:bodyView.frame.width/2, y:bodyView.frame.height/3)
        // define shape path
        let circularPath = UIBezierPath(arcCenter:position, radius:
            110, startAngle: -90.degreesToRadians, endAngle: 270.degreesToRadians, clockwise: true)
        // assign circular path to the shape path
        timerShape.path = circularPath.cgPath
        // set stroke fill color
        timerShape.fillColor = UIColor.clear.cgColor
        // set stroke properties
        timerShape.strokeColor = AppColors.buttonColor.cgColor
        timerShape.lineWidth = 15
        timerShape.strokeEnd = 0
        // add shape to body view
        bodyView.layer.addSublayer(timerShape)
    }
    
    func formatTimeRemaining()
    {
        
        let time = Constants.secondsToMinutesSeconds(seconds: Int(timeRemaining))
        let timeString = Constants.formatTimeString(minutes: time.0, seconds: time.1)
        // update timer label
        timeLabel.text = timeString
    }
    
    
    @objc func updateTime() {
        
        print("Time remaining = \(timeRemaining)")
        if timeRemaining > 0 {
            // subtract 1 second from the time remaining
            timeRemaining -= 1
        } else {
            // reset time remaining
            self.timeRemaining = selectedTime
            // stop time
            timer.invalidate()
            // display play button
            playPauseButton.setImage(UIImage(named: "play_button.svg"), for: .normal)
            timerIsCounting = false
        }
        // format time remaining
        formatTimeRemaining()
    }
    
    @IBAction func playPauseTapped(_ sender: Any) {
        
        // add animation to the timer circle only in first run
        if firstRun {
            firstRun = false
            timerShape.add(basicAnimation, forKey: nil)
        }
        // user clicks pause button
        if timerIsCounting {
            timerIsCounting = false
            // stop the timer
            timer.invalidate()
            // change the button to play
            playPauseButton.setImage(UIImage(named: "play_button.svg"), for: .normal)
            // stop animation
            pauseAnimation()
            
        }
        // user clicks play button
        else{
            timerIsCounting = true
            // change the button to play
            playPauseButton.setImage(UIImage(named: "pause_button.svg"), for: .normal)
            // init timer
            timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(updateTime), userInfo: nil, repeats: true)
            // resume the animation
            resumeAnimation()
        }
    }
    
    // pause timer circle stroke animation
    func pauseAnimation(){
        let pausedTime : CFTimeInterval = timerShape.convertTime(CACurrentMediaTime(), from: nil)
        timerShape.speed = 0.0
        timerShape.timeOffset = pausedTime
//        timeRemaining =  selectedTime - pausedTime

    }

    // resume timer circle stroke animation
    func resumeAnimation(){
        let pausedTime = timerShape.timeOffset
        timerShape.speed = 1.0
        timerShape.timeOffset = 0.0
        timerShape.beginTime = 0.0
        let timeSincePause = timerShape.convertTime(CACurrentMediaTime(), from: nil) - pausedTime
        timerShape.beginTime = timeSincePause
//        timeRemaining =  selectedTime - pausedTime
    }
 
    
    @IBAction func resetTapped(_ sender: Any) {
        
        // show alert dialog
        let alert = UIAlertController(title: "Reset Timer?", message: "Are you sure you would like to reset the timer?", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: {(_) in
            // continue counting
        }))
        alert.addAction(UIAlertAction(title: "Yes", style: .default, handler:  {(_) in
            // stop time
            self.timer.invalidate()
            // reset time remaining
            self.timeRemaining = self.selectedTime
            // reset time label
            self.formatTimeRemaining()
            // display play button
            self.playPauseButton.setImage(UIImage(named: "play_button.svg"), for: .normal)
            self.timerIsCounting = false
            
            // add animation but pause it
            self.timerShape.add(self.basicAnimation, forKey: nil)
            self.pauseAnimation()

        }))

        // format time remaining
        formatTimeRemaining()
        
        self.present(alert, animated: true, completion: nil)
    }
   
}
