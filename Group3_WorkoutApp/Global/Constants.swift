
import Foundation
import UIKit
import AVFoundation

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
        //switch statment that returns the list of exercises depending on the postion sent
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
    
    // declaring player should be outside the function
    static private var player: AVAudioPlayer?
    static func playTimerSound() {
        // unwrap play and check if it is playing something
        if let player = player, player.isPlaying {
            // stop the sound
            player.stop()
        }else{
            // set up player and play
            // get url (alarm sound path)
            guard let url = Bundle.main.path(forResource: "alarm", ofType: "mp3") else { return }
            
            do{
                // set sessions
                try AVAudioSession.sharedInstance().setMode(.default)
                try AVAudioSession.sharedInstance().setActive(true)
                
                // instantiate av audio player with the specified url
                player = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: url))
                
                // unwrap player to make sure it was created properly
                guard let player = player else {return}
                
                // play alarm
                player.play()
            }catch{
                print("An error has occurred")
            }
        }
    }
    //function that checks the exercises and changes the target label
    static func targetMuscle(exerciseList : [Exercise]) -> String{
        //values to create the types
        var count = 0
        var output = ""
        let muscleName = ["Abs","Back","Biceps","Chest","Legs","Shoulders","Triceps"]
        var isinSchedule = [false,false,false,false,false,false,false]
        //looping and taking the type of muscle and setting it to true in isinSchedule array in the correct postion
            for exercise in exerciseList{
                let  type = exercise.targetMuscle
                switch type {
                case "chest":
                    isinSchedule[3] = true
                    count = count + 1
                case "biceps":
                    isinSchedule[2] = true
                    count = count + 1
                case"triceps":
                    isinSchedule[6] = true
                    count = count + 1
                case "back":
                    isinSchedule[1] = true
                    count = count + 1
                case"shoulders":
                    isinSchedule[5] = true
                    count = count + 1
                case "abs":
                    count = count + 1
                    isinSchedule[0] = true
                case "legs":
                    count = count + 1
                    isinSchedule[4] = true
                default:
                    output = "None"
                }
            }
        //if the count of pickedMuscles is 1
        if count == 1{
            if isinSchedule[4]{
                output = "Legs"
            }
            if isinSchedule[3]{
                output = "Chest"
            }
            if isinSchedule[0]{
                output = "Abs"
            }
            if isinSchedule[1]{
                output = "Back"
            }
            if isinSchedule[5]{
                output = "Shoulder"
            }
            if isinSchedule[2]{
                output = "Bicep"
            }
            if isinSchedule[6]{
                output = "Tricep"
            }
            //if the count of picked muscles is 0
        }else if count == 0{
            output = "None"
        }
        //if all of the muscles are picked
        else if (isinSchedule[0] && isinSchedule[1] && isinSchedule[2] && isinSchedule[3] && isinSchedule[4] && isinSchedule[5] && isinSchedule[6]){
            output = "FullBody"
        }
        //if more than one and less than 7
        else{
            //looping in the isinSchedule and adding to the output if its is set to true
            var postion = 0
            for boolean in isinSchedule{
                if boolean{
                    output = output + muscleName[postion] + ", "
                }
                postion = postion + 1
            }
        output.removeLast()
        output.removeLast()
        }
        return output
    }
    
    
    // Encodes & saves the workout duration as "workoutData.plist" in the App's Sandbox
   static func saveWorkoutData(_ workoutsList: [[String: Double]]) {
        // Creating the directory and filename
        let documentsDirectory = FileManager.default.urls(for: .documentDirectory,
         in: .userDomainMask).first!
        let archiveURL =
         documentsDirectory.appendingPathComponent("workoutData").appendingPathExtension("plist")
        
        let propertyListEncoder = PropertyListEncoder()
        let encodedWorkoutData = try? propertyListEncoder.encode(workoutsList)
        try? encodedWorkoutData?.write(to: archiveURL, options: .noFileProtection)
    }
    
    // Decodes, reads & returns the array of dictionaries (workout data)
     static func getWorkoutData() -> [[String: Double]]? {
        
        // Creating the directory and filename
        let documentsDirectory = FileManager.default.urls(for: .documentDirectory,
         in: .userDomainMask).first!
        let archiveURL =
         documentsDirectory.appendingPathComponent("workoutData").appendingPathExtension("plist")
        let propertyListDecoder = PropertyListDecoder()
        
        
        if let retrievedWorkoutData = try? Data(contentsOf: archiveURL), let decodedWorkoutData = try? propertyListDecoder.decode(Array<[String: Double]>.self, from: retrievedWorkoutData) {
            return decodedWorkoutData
        }
        
        return []
    }
    
    // Encodes & saves playing workout dates as "playingWorkoutDates.plist" in the App's Sandbox
   static func savePlayingWorkoutDates(_ workoutsList: [Date]) {
        // Creating the directory and filename
        let documentsDirectory = FileManager.default.urls(for: .documentDirectory,
         in: .userDomainMask).first!
        let archiveURL =
         documentsDirectory.appendingPathComponent("playingWorkoutDates").appendingPathExtension("plist")
        
        let propertyListEncoder = PropertyListEncoder()
        let encodedDateList = try? propertyListEncoder.encode(workoutsList)
        try? encodedDateList?.write(to: archiveURL, options: .noFileProtection)
    }
    
    // Decodes, reads & returns the array of playing workout dates
     static func getPlayingWorkoutDates() -> [Date]? {
        
        // Creating the directory and filename
        let documentsDirectory = FileManager.default.urls(for: .documentDirectory,
         in: .userDomainMask).first!
        let archiveURL =
         documentsDirectory.appendingPathComponent("workoutData").appendingPathExtension("plist")
        let propertyListDecoder = PropertyListDecoder()
        
        
        if let retrievedDateList = try? Data(contentsOf: archiveURL), let decodedDateList = try? propertyListDecoder.decode(Array<Date>.self, from: retrievedDateList) {
            return decodedDateList
        }
        
        return []
    }
    
    // Encodes & saves playing schedule counter as "playingScheduleCounter.plist" in the App's Sandbox
    static func savePlayedScheduleData(_ workoutsList: [String: Int]) {
        // Creating the directory and filename
        let documentsDirectory = FileManager.default.urls(for: .documentDirectory,
         in: .userDomainMask).first!
        let archiveURL =
         documentsDirectory.appendingPathComponent("playingWorkoutDates").appendingPathExtension("plist")
        
        let propertyListEncoder = PropertyListEncoder()
        let encodedCounterList = try? propertyListEncoder.encode(workoutsList)
        try? encodedCounterList?.write(to: archiveURL, options: .noFileProtection)
    }
    
    // Decodes, reads & returns the array of playing workout dates
     static func getPlayedScheduleData() -> [String: Int]? {
        
        // Creating the directory and filename
        let documentsDirectory = FileManager.default.urls(for: .documentDirectory,
         in: .userDomainMask).first!
        let archiveURL =
         documentsDirectory.appendingPathComponent("workoutData").appendingPathExtension("plist")
        let propertyListDecoder = PropertyListDecoder()
        
        
        if let ScheduleDataList = try? Data(contentsOf: archiveURL), let decodedScheduleDataList = try? propertyListDecoder.decode([String: Int].self, from: ScheduleDataList) {
            return decodedScheduleDataList
        }
        
        return [:]
    }
}
