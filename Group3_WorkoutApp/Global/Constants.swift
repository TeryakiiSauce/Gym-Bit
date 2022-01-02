
import Foundation
import UIKit

struct Constants {
    
    // body and header radius
    static let viewRadius : CGFloat = 10
    
    
    // function to change the radius on view did load in the view controller
    static func buildRoundedUIView(headerView: UIView?, bodyView: UIView?, button: UIButton?){
        
        if let headerView = headerView {
            headerView.layer.cornerRadius = Constants.viewRadius
            headerView.layer.masksToBounds = true
            
            headerView.layer.maskedCorners = [.layerMaxXMaxYCorner, .layerMaxXMinYCorner]
        }
        
        if let bodyView = bodyView {
            bodyView.layer.cornerRadius = Constants.viewRadius
            bodyView.layer.masksToBounds = true
            
        }
        
    
        if let button = button {
            button.layer.cornerRadius = Constants.viewRadius
            button.layer.masksToBounds = true
            button.backgroundColor = AppColors.buttonColor
            button.tintColor = AppColors.bodyBg
        }
    }
    
    // format time functions
    static func secondsToHoursMinutesSeconds(seconds: Int) -> (Int,Int,Int)
    {
        return (seconds / 3600, (seconds % 3600)/60,  (seconds % 3600) % 60)
    }
    
    static func formatTimeString(hours: Int, minutes: Int, seconds: Int) -> String {
        var timeString = ""
        timeString += String (format: "%02d", hours)
        timeString += " : "
        timeString += String (format: "%02d", minutes)
        timeString += " : "
        timeString += String (format: "%02d", seconds)
        
        return timeString
                       
    }
}
