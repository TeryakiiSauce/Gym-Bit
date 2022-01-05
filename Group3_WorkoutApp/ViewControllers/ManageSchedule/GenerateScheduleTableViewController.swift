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
    @IBOutlet weak var MainButton: UIButton!
    
    //prepare segue function
    override func prepare(for segue: UIStoryboardSegue, sender:Any?) {
        //a function that generates random exercises
        generateRandomExercises()
        //creating a schedule for the generated exercises
        let genratedSchedule = Schedule(dateCreated: Date(), name: "Generated Workout", playsCounter: 0,exercises: listOfSelectedExerciseArrays)
        //setting controller variable
        let viewController = segue.destination as! CreateScheduleViewController
        //setting the displayed schedule in the create schedule page as the one gernerated in this page
        viewController.displayedSchedule = genratedSchedule
        //resetting the array of selected exerciese
        listOfSelectedExerciseArrays.removeAll()
    }
    
    //view did load function
    override func viewDidLoad() {
        super.viewDidLoad()
        // apply default styling
        Constants.applyDefaultStyling(backgroundView: view, headerView: nil, bodyView: bodyView, mainButton: MainButton, secondaryButton: nil)
        customTableView.delegate = self
        customTableView.dataSource = self
        customTableView.allowsMultipleSelection = true
        //styling table view
        customTableView.separatorStyle = .none
        customTableView.showsVerticalScrollIndicator = false
        //disable button and change color
        MainButton.isEnabled = false
        MainButton.layer.backgroundColor = AppColors.buttonSecondaryColor.cgColor
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

    //function that gets the selected row index and sets that index to true in the selectedmuscles array
    func tableView(_ tableView: UITableView, didSelectRowAt : IndexPath) {
        selectedMuscles[didSelectRowAt.row] = true
        numberOfSelectedMuscles = numberOfSelectedMuscles+1
        //enable button and change color
        MainButton.layer.backgroundColor = AppColors.buttonColor.cgColor
        MainButton.isEnabled = true
    }
    
    //method that checkes if the user deselects a cell and removes it from the pickedexercises array
    func tableView(_ tableView: UITableView, didDeselectRowAt : IndexPath) {
        selectedMuscles[didDeselectRowAt.row] = false
        numberOfSelectedMuscles = numberOfSelectedMuscles-1
        //if no muscles are selected disable button and change color
        if numberOfSelectedMuscles == 0 {
            MainButton.isEnabled = false
            MainButton.layer.backgroundColor = AppColors.buttonSecondaryColor.cgColor
        }
    }
    
    // function that generates random exercises depanding on how many muscles were selected
    func generateRandomExercises(){
            //switch statment that checks the number of exercises selected
            //calling a functiuon that generates the exercises by taking the number wanted
            switch numberOfSelectedMuscles {
            case 1:
                getGeneratedExercises(numberOfExercisesWanted: 7)
            case 2:
                getGeneratedExercises(numberOfExercisesWanted: 4)
            case 3,4:
                getGeneratedExercises(numberOfExercisesWanted: 2)
            case 5,6,7:
                getGeneratedExercises(numberOfExercisesWanted: 1)
            default:
                getGeneratedExercises(numberOfExercisesWanted: 1)
            }
        //reseting the arrays that check the statments
        numberOfSelectedMuscles = 0
        selectedMuscles = [false,false,false,false,false,false,false]
    }
    
    //function that takes the number of wanted exercises to be generated
    func getGeneratedExercises(numberOfExercisesWanted: Int){
        //counting the postion and storing temp exercise list
        var postion = 0
        var TempExerciseList: [Exercise] = []
        //for loop in the selecte muscles to see if the bool is true
        for isSelected in selectedMuscles{
            if isSelected{
                //generating the temp exercises by using the postion an storing it in the temp list
                TempExerciseList = Constants.getExerciseArray(exercisePostion: postion)
                //adding the modified temp list to the list of selected exercises
                listOfSelectedExerciseArrays = listOfSelectedExerciseArrays + Constants.randomNumberGenerator(exercisesWanted: numberOfExercisesWanted, exersizeArray: TempExerciseList)
            }
            postion = postion+1
        }
    }
}
