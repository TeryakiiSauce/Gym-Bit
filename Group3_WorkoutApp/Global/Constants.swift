
import Foundation
import UIKit

struct Constants {
    
    // body and header radius
    static let viewRadius : CGFloat = 10
    
    
    // function to change the radius on view did load in the view controller
    static func buildRoundedUIView(
        headerView: UIView?, bodyView: UIView?, button: UIButton?){
        
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
    
    static func applyDefaultStyling(
        backgroundView: UIView?,
        headerView: UIView?, bodyView: UIView?, mainButton: UIButton?, secondaryButton: UIButton?){
        
        if let backgroundView = backgroundView {
            backgroundView.backgroundColor = AppColors.phoneBg
        }
        
        
        if let headerView = headerView {
            headerView.layer.cornerRadius = Constants.viewRadius
            headerView.layer.masksToBounds = true
            headerView.backgroundColor = AppColors.bodyBg
            headerView.layer.maskedCorners = [.layerMaxXMaxYCorner, .layerMaxXMinYCorner]
        }
        
        if let bodyView = bodyView {
            bodyView.layer.cornerRadius = Constants.viewRadius
            bodyView.layer.masksToBounds = true
            bodyView.backgroundColor = AppColors.bodyBg
        }
        
    
        if let mainButton = mainButton {
            mainButton.layer.cornerRadius = Constants.viewRadius
            mainButton.layer.masksToBounds = true
            mainButton.backgroundColor = AppColors.buttonColor
            mainButton.tintColor = AppColors.bodyBg
        }
        
        if let secondaryButton = secondaryButton {
            secondaryButton.layer.cornerRadius = Constants.viewRadius
            secondaryButton.layer.masksToBounds = true
            secondaryButton.backgroundColor = AppColors.buttonColor
            secondaryButton.tintColor = AppColors.bodyBg
        }
    }
    
    // format time functions
    static func secondsToMinutesSeconds(seconds: Int) -> (Int,Int)
    {
        return ((seconds % 3600)/60,  (seconds % 3600) % 60)
    }
    
    static func formatTimeString(minutes: Int, seconds: Int) -> String {
        var timeString = ""
        timeString += String (format: "%02d", minutes)
        timeString += " : "
        timeString += String (format: "%02d", seconds)
        
        return timeString
                       
    }
    
    
    //random exercise picker function
    static func randomNumberGenerator(exercisesWanted: Int,exersizeArray: [Exercise]) -> [Exercise]{
        //setting the output array and making a temporary editable array
        var outputArray : [Exercise] = []
        var temparray:[Exercise] = []
        temparray.append(contentsOf: exersizeArray)

        //while loop that runs to the amount of times requested
        while temparray.count > (exersizeArray.count-exercisesWanted) {

            //taking a random key from array
            let arrayKey = Int(arc4random_uniform(UInt32(temparray.count)))
            //adding the randomly selected exercise to the output array
            outputArray.append(temparray[arrayKey])

            // make sure the exercise isnt repeated by making it the last postion in the array and deleting it
            temparray.swapAt(arrayKey, temparray.count-1)
            temparray.removeLast()
        }
        return outputArray
    }
    
    //function that gets an exercise array 
    static func getExerciseArray(exercisePostion: Int)-> [Exercise]{
        switch exercisePostion {
        case 0:
            return DefaultData.absExercises
        case 1:
            return DefaultData.backExercises
        case 2:
            return DefaultData.bicepExercises
        case 3:
            return DefaultData.chestExercises
        case 4:
            return DefaultData.legExercises
        case 5:
            return DefaultData.shoulderExercises
        default:
            return DefaultData.tricepExercises
        }
    }
}
