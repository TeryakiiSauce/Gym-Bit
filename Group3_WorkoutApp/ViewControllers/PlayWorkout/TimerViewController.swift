//
//  TimerViewController.swift
//  Group3_WorkoutApp
//
//  Created by Ali Alqallaf on 23/12/2021.
//

import UIKit

// format the time
extension TimeInterval {
    var time: String {
        return String(format:"%02d:%02d", Int(self/60),  Int(ceil(truncatingRemainder(dividingBy: 60))) )
    }
}

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
    
    // constants and variables
    let shapeLayer = CAShapeLayer()
    var selectedTime: Int = 300 //default seconds
    var timeRemaining: TimeInterval = 60 // time remaining
    var endTime: Date?
    var timeLabel =  UILabel() // label to show the remaining time
    var timer = Timer() // timer to calculate the remaining selected time
    // to animate stroke end property
    let basicAnimation = CABasicAnimation(keyPath: "strokeEnd")
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // apply default styling for the views
        Constants.buildRoundedUIView(headerView: headerView, bodyView: bodyView, button:nil)
        drawTimerCircle()
        addTimeLabel()
        
        
        // define the future end time by adding the timeLeft to now Date()
        endTime = Date().addingTimeInterval(timeRemaining)
        
        
        
    }
    
    
    
    func addTimeLabel() {
        timeLabel = UILabel(frame: CGRect(x: shapeLayer.frame.midX ,y: shapeLayer.frame.height/2, width: 100, height: 50))
        timeLabel.center = CGPoint(x:bodyView.frame.width/2, y:bodyView.frame.height/3)
        timeLabel.textAlignment = .center
        timeLabel.text = timeRemaining.time
        bodyView.addSubview(timeLabel)
    }
    
    func drawTimerCircle()
    {
        
        // body view center point
        let position = CGPoint(x:bodyView.frame.width/2, y:bodyView.frame.height/3)
        // define shape path
        let circularPath = UIBezierPath(arcCenter: position, radius: 140, startAngle: 0, endAngle: 2 * CGFloat.pi, clockwise: true)
        
        
        // change circle fill and stoke color
        shapeLayer.strokeColor = AppColors.buttonColor.cgColor
        shapeLayer.fillColor = AppColors.phoneBg.cgColor
        // stroke width
        shapeLayer.lineWidth = 20
        // assign circular path to the shape path
        shapeLayer.path = circularPath.cgPath
        //
        shapeLayer.strokeEnd = 0
        // add shape to the view
        bodyView.layer.addSublayer(shapeLayer)
        bodyView.addSubview(timeLabel)
        
    }
    
    @objc func updateTime() {
        
        // don't remove the stroke when reaching the end
        basicAnimation.fillMode = CAMediaTimingFillMode.forwards
        basicAnimation.isRemovedOnCompletion = false
        
        
//        if timeRemaining > 0 {
//            // subtract 1 from the time remaining if > 10
//            timeRemaining -= 1
//        }else{
//            // stop the timer when time remaining reaches 0
//            timer.invalidate()
//            // reset time remaining to its original value
//            timeRemaining = 10
//        }
        // update timer label
        //        timerLabel.text = "\(timeRemaining)"
        
        if timeRemaining > 0 {
            // subtract 1 second from the time remaining
            timeRemaining = endTime?.timeIntervalSinceNow ?? 0
            timeLabel.text = timeRemaining.time
        } else {
            timeLabel.text = "00:00"
            timer.invalidate()
        }
    }
    
    @IBAction func playTapped(_ sender: Any) {
        // init timer
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(updateTime), userInfo: nil, repeats: true)
        
        // define the fromValue, toValue and duration of animation
        basicAnimation.fromValue = 0
        basicAnimation.toValue = 1
        basicAnimation.duration = timeRemaining
        
        shapeLayer.add(basicAnimation, forKey: nil)
        
        
        let image = UIImage(named: "pause_button.svg")
        playPauseButton.setImage(image, for: .normal)
    }
    
    
    @IBAction func pauseTapped(_ sender: Any) {
        // stop the timer
        timer.invalidate()
    }
    
    
    @IBAction func resetTapped(_ sender: Any) {
        // stop the timer
        timer.invalidate()
        // reset time remaining
        timeRemaining = 10
        // update timer label
        //        timerLabel.text = "\(timeRemaining)"
        
    }
    
    
    
    
}
