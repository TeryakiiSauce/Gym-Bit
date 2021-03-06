import UIKit

class CreateScheduleViewController: UIViewController,UITableViewDataSource, UITableViewDelegate {

    //filling data to test
    var displayedSchedule = Schedule(dateCreated: Date(), name: "Your Schedule", playsCounter: 0, exercises: [])
    var addedExercises : [Exercise] = []
    var popuppageType = ["ClearTable" : false,"Back" : false,"changeName" : false]
    var isEditingSchedule = false
    var orgScheduleTitle = ""

    //connectors that connect the gui to code
    @IBOutlet weak var headerView: UIView!
    @IBOutlet weak var bodyView: UIView!
    @IBOutlet weak var mainButton: UIButton!
    @IBOutlet weak var customTableView: UITableView!
    @IBOutlet weak var IconImage: UIImageView!
    @IBOutlet weak var scheduleName: UILabel!
    @IBOutlet weak var editableTableStackView: UIStackView!
    @IBOutlet weak var EmptyTableStackView: UIStackView!
    @IBOutlet weak var clearPageButton: UIButton!
    @IBOutlet weak var MuscleLabel: UILabel!
    @IBOutlet weak var targetLabel: UILabel!
    @IBOutlet weak var emptyLabel: UILabel!
    
    //button that clears the whole table
    @IBAction func ClickClearScheduleButton(_ sender: Any) {
        popuppageType["ClearTable"]?.toggle()
        //create an instance of popoup page
          let popup = openPopupPage()
        popup.ClearPopupStackView.isHidden = false
        popuppageType["ClearTable"]?.toggle()
        MuscleLabel.text = Constants.targetMuscle(exerciseList: displayedSchedule.exercises)
    }
    
    //function that prepares data before preforming a segue
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        //check the segue identifier
        if segue.identifier == "showExerciseDetail" {
            //access page controller
            let viewController = segue.destination as! ViewDetailExerciseViewController
            //setup selected row
            let selectedCell = customTableView.indexPathForSelectedRow?.row
            //adject the pages information 
            viewController.imageName = (displayedSchedule.exercises[selectedCell!].imagePath)
            viewController.exDescription = (displayedSchedule.exercises[selectedCell!].description)
            viewController.exTips = (displayedSchedule.exercises[selectedCell!].tips)
            viewController.title = (displayedSchedule.exercises[selectedCell!].name)
            
        }
    }
    
    //outlit that triggers the select muscle page when the button is clicked
    @IBAction func ClickAddSchedulebutton(_ sender: Any) {
        //preforming a segue
        self.performSegue(withIdentifier: "addExerciseSegue", sender: self)
    }
    
    /**
     EDIT: sends the newly created schedule to the main schedules list screen
     --button that saves the Schedule in a .json file or sends to add exercises page--
     */
    @IBAction func ClickSaveButton(_ sender: Any) {
        //if statment that checks if the user has added an exercises or not
        if displayedSchedule.exercises.count != 0 {
            
            // performing segue
            performSegue(withIdentifier: "unwindToViewSchedule", sender: self)
        }
        else{
            //preforming a segue
            performSegue(withIdentifier: "addExerciseSegue", sender: self)
        }
    }
    
    // Opens a popup that allows users to change the schedule name
    @IBAction func ClickUpdateScheduleButton(_ sender: Any) {
        
        //creating a var of the popup viewcontroller
        popuppageType["changeName"]?.toggle()
        let popup = openPopupPage()
        popup.updatePopupStackView.isHidden = false
        popuppageType["changeName"]?.toggle()
    }

    //function that creates an unwind segue for this page
    @IBAction func unwindtoCreateSchedule(seague: UIStoryboardSegue){
        //check if the source that the unwind came from is popup page
        if let sourceViewController = seague.source as? PopupViewController   {
            //if statment that checks boolean for isClearComfirmPressed and isUpdatePressed
            if sourceViewController.isClearConfirmPressed{
                //removing all the exercises
                displayedSchedule.exercises.removeAll()
                //reloading the table
                customTableView.reloadData()
                //seting the edit stack view to hidden and changing the button name
                editableTableStackView.isHidden = true
                EmptyTableStackView.isHidden = false
                mainButton.setTitle("Add Exercise", for: .normal)
            }
            else if sourceViewController.isupdatePressed {
                //changing the name and saving the new name in the displayedSchedule value
                scheduleName.text = sourceViewController.ScheduleNameTextField.text
                
                if let unwrappedText = sourceViewController.ScheduleNameTextField.text {
                    displayedSchedule.name = unwrappedText
                }
            }
        }
        if let sourceViewController = seague.source as? ExerciseListViewController      {
            //adding the selected workouts to the page/values
            addedExercises = sourceViewController.pickedExercises
            displayedSchedule.exercises.append(contentsOf: addedExercises)
            //reloading the table
            customTableView.reloadData()
        }
    }
    
    //view did load function
    override func viewDidLoad() {
        super.viewDidLoad()
        // apply default styling
       
        customTableView.delegate = self
        customTableView.dataSource = self
        //styling table view
        customTableView.separatorStyle = .none
        customTableView.showsVerticalScrollIndicator = false
        scheduleName.text = displayedSchedule.name
        //creating a custom back nav bar button
        self.navigationItem.hidesBackButton = true
        let newBackButton = UIBarButtonItem(title: "Back", style: UIBarButtonItem.Style.plain, target: self, action: #selector(CreateScheduleViewController.back(sender:)))
        newBackButton.tintColor = AppColors.buttonColor
        self.navigationItem.leftBarButtonItem = newBackButton
    }
    
    // Don't know what this override function do but it worked as I expected it so kudos :)
    // Makes sure that no duplicated schedule titles would get saved; probably not very efficient
    override func viewDidLayoutSubviews() {
        var isDuplicate = false
        for schedule in Schedule.getSchedules() {
            if let unwrappedScheduleName = scheduleName.text {
                //print("schedule = \(schedule.name)")
                //print("unwrapped schedule = \(unwrappedScheduleName)")
                if schedule.name == unwrappedScheduleName {
                    isDuplicate = true
                    //print("found similar = \(isDuplicate)")
                    break
                }
            }
        }
        
        if isDuplicate == true {
            if isEditingSchedule == true {
                mainButton.isEnabled = true
                mainButton.backgroundColor = UIColor(red: 136/255, green: 192/255, blue: 208/255, alpha: 1)
                updateMainButton()
                
            } else {
                mainButton.isEnabled = false
                mainButton.backgroundColor = .lightGray
                mainButton.setTitle("Please change the schedule title!", for: .disabled)
            }

        } else {
            mainButton.isEnabled = true
            mainButton.backgroundColor = UIColor(red: 136/255, green: 192/255, blue: 208/255, alpha: 1)
            updateMainButton()
        }
    }
    
    //if the back nav bar is clicked
    @objc func back(sender: UIBarButtonItem) {
        popuppageType["Back"]?.toggle()
        let popup = openPopupPage()
        popup.LeavePopupStackView.isHidden = false
        popuppageType["Back"]?.toggle()
       }
    
    //view wil appear function
    override func viewWillAppear(_ animated: Bool) {
        //checking if there are any exercises there
        updateMainButton()
        Constants.applyDefaultStyling(backgroundView: view, headerView: headerView, bodyView: bodyView, mainButton: mainButton, secondaryButton: nil, vc: self)
        Constants.applyTableAndTextStyling(titleLabels: nil, bodyLabels: [targetLabel,MuscleLabel,emptyLabel], tableView: customTableView)
        MuscleLabel.text = Constants.targetMuscle(exerciseList: displayedSchedule.exercises)
    }
   
    //function that sets the number of rows in the exercises table
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return displayedSchedule.exercises.count
    }
    
    //function that fills the exercise table
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //creating a cell identifier
        let cell = customTableView.dequeueReusableCell(withIdentifier: "customCell") as! CustomTableViewCell
        
        Constants.applyCellStyling(cell: cell)
        let bgColorView = UIView()
        cell.selectedBackgroundView = bgColorView
        //adding data to the cell
        cell.titleLabel.text = displayedSchedule.exercises[indexPath.row].name
        cell.subtitleLabel.text = displayedSchedule.exercises[indexPath.row].targetMuscle
        cell.cellImage.image = UIImage(named: displayedSchedule.exercises[indexPath.row].imagePath)
        return cell
    }

    //function that sets the row height for the table
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }

    //makes it so that you can swipe to delete
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        //checking the editing style
        if editingStyle == .delete {
            
            //removing the instance from the stored schedule
            displayedSchedule.exercises.remove(at: indexPath.row)
            //removing the row from the table in the gui
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    

    
    
    
    //function that creates an instance of popup page viewcontreoller and returns it
    func openPopupPage() -> PopupViewController{
        let popOverVc = UIStoryboard(name: "ManageSchedule", bundle: nil).instantiateViewController(withIdentifier: "sbPopupID") as! PopupViewController
        //assigning it as a child view and opening it over the parent view
        self.addChild(popOverVc)
        popOverVc.view.frame = self.view.frame
        self.view.addSubview(popOverVc.view)
        popOverVc.didMove(toParent: self)
        return popOverVc
    }
    
    func updateMainButton(){
        if displayedSchedule.exercises.count == 0 {
            //hiding the editable stack view and displaying an empty page
            editableTableStackView.isHidden = true
            EmptyTableStackView.isHidden = false
            //changeing the button name
            mainButton.setTitle("Add Exercise", for: .normal)
        }
        else {
            //hiding the empty view and displaing the editable view
            editableTableStackView.isHidden = false
            EmptyTableStackView.isHidden = true
            //changing the button name
            mainButton.setTitle("Save", for: .normal)
        }
    }
}
