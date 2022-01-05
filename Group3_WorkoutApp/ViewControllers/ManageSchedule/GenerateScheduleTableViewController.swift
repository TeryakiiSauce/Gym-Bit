//
//  GenerateScheduleTableViewCell.swift
//  Group3_WorkoutApp
//
//  Created by mobileProg on 04/01/2022.
//

import UIKit

class GenerateScheduleTableViewController:UIViewController,UITableViewDataSource, UITableViewDelegate  {
    
    //temp infromation
    let cellNameArray = ["Abs","Back","Biceps","Chest","Legs","Shoulders","Triceps"]
    var selectedMuscles = [false,false,false,false,false,false,false]
    var numberOfSelectedMuscles = 0
    var listOfSelectedExerciseArrays:[Exercise] = []
    let exersizeCountArray =  [DefaultData.absExercises.count,DefaultData.backExercises.count,DefaultData.bicepExercises.count,DefaultData.chestExercises.count,DefaultData.legExercises.count,DefaultData.shoulderExercises.count,DefaultData.tricepExercises.count]
    
    
    //connectors connecting gui to code
    @IBOutlet weak var bodyView: UIView!
    @IBOutlet weak var customTableView: UITableView!
    
    override func prepare(for segue: UIStoryboardSegue, sender:Any?) {
        generateRandomExercises()
        let genratedSchedule = Schedule(dateCreated: Date(), name: "Generated Workout", playsCounter: 0,exercises: listOfSelectedExerciseArrays)
        //setting controller variable
        
        let viewController = segue.destination as! CreateScheduleViewController
        viewController.displayedSchedule = genratedSchedule
        listOfSelectedExerciseArrays.removeAll()
    }
    
    //function that resets the table whenever the page appears
    override func viewWillAppear(_ animated: Bool) {
        
        customTableView.reloadData()
    }
    
    //view did load function
    override func viewDidLoad() {
        super.viewDidLoad()
        // apply default styling
        Constants.buildRoundedUIView(headerView: nil, bodyView: bodyView, button:nil)
        customTableView.delegate = self
        customTableView.dataSource = self
        customTableView.allowsMultipleSelection = true
        //styling table view
        customTableView.separatorStyle = .none
        customTableView.showsVerticalScrollIndicator = false
    }
    
    
    
    //sets the number of rows in the table
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 7
    }
    
    //function that fills the table
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //creating a cell identifier
        let cell = customTableView.dequeueReusableCell(withIdentifier: "customCell") as! CustomTableViewCell
        //adding data to the cell
        cell.titleLabel.text = cellNameArray[indexPath.row]
        cell.subtitleLabel.text = "Total exercises (" + String(exersizeCountArray[indexPath.row]) + ")"
        cell.cellImage.image = UIImage(named: cellNameArray[indexPath.row])
        return cell
    }

    //function that sets the cell height
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }

    func tableView(_ tableView: UITableView, didSelectRowAt : IndexPath) {
        selectedMuscles[didSelectRowAt.row] = true
    }
    
    //method that checkes if the user deselects a cell and removes it from the pickedexercises array
    func tableView(_ tableView: UITableView, didDeselectRowAt : IndexPath) {
        selectedMuscles[didDeselectRowAt.row] = false
    }
    
    func generateRandomExercises(){
       
        for isSelected in selectedMuscles{
            
            if isSelected{
                numberOfSelectedMuscles = numberOfSelectedMuscles+1
            }
        }
        
            switch numberOfSelectedMuscles {
            case 1:
                getGeneratedExercises(numberOfExercisesWanted: 7)
            case 2:
                getGeneratedExercises(numberOfExercisesWanted: 4)
            case 3:
                getGeneratedExercises(numberOfExercisesWanted: 2)
            case 4:
                getGeneratedExercises(numberOfExercisesWanted: 2)
            case 5:
                getGeneratedExercises(numberOfExercisesWanted: 1)
            case 6:
                getGeneratedExercises(numberOfExercisesWanted: 1)
            default:
                getGeneratedExercises(numberOfExercisesWanted: 1)
            }
        numberOfSelectedMuscles = 0
        selectedMuscles = [false,false,false,false,false,false,false]
    }
    
    
    func getGeneratedExercises(numberOfExercisesWanted: Int){
        var postion = 0
        var TempExerciseList: [Exercise] = []
        for isSelected in selectedMuscles{
            if isSelected{
                TempExerciseList = Constants.getExerciseArray(exercisePostion: postion)
                listOfSelectedExerciseArrays = listOfSelectedExerciseArrays + Constants.randomNumberGenerator(exercisesWanted: numberOfExercisesWanted, exersizeArray: TempExerciseList)

            }
            postion = postion+1
        }
        
    }
}
