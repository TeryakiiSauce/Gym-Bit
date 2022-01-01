import UIKit

class CreateScheduleViewController: UIViewController,UITableViewDataSource, UITableViewDelegate {

    //filling data to test
    var titles = ["Workout 1", "Workout 2", "Workout 3", "Workout 4"]
    var subtitles = ["Legs workout 1", "Back workout 2", "Chest workout 3", "abs workout 4"]
    var images = ["abs1", "abs2", "abs3", "abs4"]
    var schedules =
    Schedule(dateCreated: nil, name: "", playsCounter: 0, exercises: [Exercise(name: "bench Press", description: "benche press description", imagePath: "/path", tips: ["tip1","tip2"], targetMuscle: Exercise.TargetMuscle.chest.rawValue)])
    
    let exerciseList : [Exercise] = []
    
    //connectors that connect the gui to code
    @IBOutlet weak var headerView: UIView!
    @IBOutlet weak var bodyView: UIView!
    @IBOutlet weak var mainButton: UIButton!
    @IBOutlet weak var customTableView: UITableView!
    @IBOutlet weak var IconImage: UIImageView!
    @IBOutlet weak var scheduleName: UILabel!
    
    //button that clears the whole table
    @IBAction func ClickClearScheduleButton(_ sender: Any) {
        //removing all the arrays
        titles.removeAll()
        subtitles.removeAll()
        images.removeAll()
        //reloading the table
        customTableView.reloadData()
    }
    
    @IBAction func ClickAddSchedulebutton(_ sender: Any) {
    }
    
    //button that saves the Schedule in a .json file
    @IBAction func ClickSaveButton(_ sender: Any) {

        Schedule.saveSchedules(schedules)
    }
    
    //method to opens a popup and changes  the schedule name
    @IBAction func ClickUpdateScheduleButton(_ sender: Any) {
        
        //creating a var of the popup viewcontroller
        let popOverVc = UIStoryboard(name: "ManageSchedule", bundle: nil).instantiateViewController(withIdentifier: "sbPopupID") as! PopupViewController
        
        //assigning it as a child view and opening it over the parent view
        self.addChild(popOverVc)
        popOverVc.view.frame = self.view.frame
        self.view.addSubview(popOverVc.view)
        popOverVc.didMove(toParent: self)
    }
    
    
    //function that creates an unwind segue for this page
    @IBAction func unwindtoCreateSchedule(seague: UIStoryboardSegue){
        if let sourceViewController = seague.source as? PopupViewController   {
            scheduleName.text = sourceViewController.ScheduleNameTextField.text
                }
        if let sourceViewController = seague.source as? MuscleListViewController      {
            
                }
    }
    
    //view did load function
    override func viewDidLoad() {
        super.viewDidLoad()
        // apply default styling
        Constants.buildRoundedUIView(headerView: headerView, bodyView: bodyView, button:mainButton)
        customTableView.delegate = self
        customTableView.dataSource = self
        //styling table view
        customTableView.separatorStyle = .none
        customTableView.showsVerticalScrollIndicator = false
    }
    
    //function that sets the number of rows in the exercises table
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return titles.count
    }
    
    //function that fills the exercise table
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //creating a cell identifier
        let cell = customTableView.dequeueReusableCell(withIdentifier: "customCell") as! CustomTableViewCell
        //adding data to the cell
        cell.titleLabel.text = titles[indexPath.row]
        cell.subtitleLabel.text = subtitles[indexPath.row]
        cell.cellImage.image = UIImage(named: images[indexPath.row])
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
            //removing the instance from the stored array
            titles.remove(at: indexPath.row)
            images.remove(at: indexPath.row)
            subtitles.remove(at: indexPath.row)
            //removing the row from the table in the gui
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
}
