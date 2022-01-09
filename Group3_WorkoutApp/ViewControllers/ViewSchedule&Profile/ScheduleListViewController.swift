import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    
    /// ===================================================
    // MARK: - DEFAULT VALUES VARIABLES
    
    
    var schedulesListArr = DefaultData.schedules
    var selectedScheduleIndex = 0
    
    
    // MARK: END
    /// ===================================================
    
    
    /// ===================================================
    // MARK: - SCREEN BUTTONS VARIABLES
    
    
    @IBOutlet weak var headerView: UIView!
    @IBOutlet weak var bodyView: UIView!
    @IBOutlet weak var mainButton: UIButton!
    @IBOutlet weak var customTableView: UITableView!
    @IBOutlet weak var SecondayButton: UIButton!
    @IBOutlet weak var dateLbl: UILabel!
    @IBOutlet weak var activatedScheduleLbl: UILabel!
    
    
    // MARK: END
    /// ===================================================
    
    
    /// ===================================================
    // MARK: - SCREEN LOADING FUNCTIONS
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Default styling
        Constants.applyDefaultStyling(backgroundView: view, headerView: headerView, bodyView: bodyView, mainButton: mainButton, secondaryButton: SecondayButton)
        customTableView.delegate = self
        customTableView.dataSource = self
        
        // Table view styling
        customTableView.separatorStyle = .none
        customTableView.showsVerticalScrollIndicator = false
        
        
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMM d, yyyy"
        dateLbl.text = "Date Today: \(dateFormatter.string(from: Date()))"
    }
    
    // Updates the view whenever the screen appears
    override func viewWillAppear(_ animated: Bool) {
        customTableView.reloadData()
        
        //print("Currently activated schedule: \(DefaultData.activatedSchedule). Index = \(selectedScheduleIndex)")
        
        activatedScheduleLbl.text = schedulesListArr[selectedScheduleIndex].name
    }
    
    
    // MARK: END
    /// ===================================================
    
    
    /// ===================================================
    // MARK: - NAVIGATION CONTROL FUCNTIONS
    
    
    // Passes the selected schedule and prepares the next page [View Schedule]
    override func prepare(for segue: UIStoryboardSegue, sender:Any?) {
        if segue.identifier == "viewScheduleLink" {
            let viewCurrScheduleScreen = segue.destination as! ViewScheduleViewController
            
            if let selectedSchedule = customTableView.indexPathForSelectedRow?.row {
                
                selectedScheduleIndex = selectedSchedule
                
                viewCurrScheduleScreen.selectedSchedule = self.schedulesListArr[selectedSchedule]
            }
        }
    }
    
    // UNWINDING
    @IBAction func unwindtoViewSchedule(seague: UIStoryboardSegue){
        // Things to do done when "unwind" is called by "Create Schedule (Aziz)"
        if let sourceViewController = seague.source as? CreateScheduleViewController   {
            
            // Updates the displayed schedule array
            schedulesListArr = schedulesListArr + [sourceViewController.displayedSchedule]
            
            // Saving the schedule
            Schedule.saveSchedules(schedulesListArr)
        }
    }
    
    
    // MARK: END
    /// ===================================================
    
    
    /// ===================================================
    // MARK: - TABLE VIEW FUNCTIONS
    
    
    // Returns the number of rows in the Schedules list
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return schedulesListArr.count
    }
    
    // Sets the table data
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = customTableView.dequeueReusableCell(withIdentifier: "customCell") as! CustomTableViewCell
        
        let schedule = schedulesListArr[indexPath.row]
        
        cell.titleLabel.text = schedule.name
        
        if schedule.name == DefaultData.activatedSchedule {
            //print("show image for \(schedule.name)")
            
            cell.imageView?.image = UIImage(systemName: "checkmark.circle.fill")
        } else {
            cell.imageView?.image = UIImage(systemName: "")
        }
        
        return cell
    }
    
    // Sets the row height
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 110
    
    }
    
    
    // MARK: END
    /// ===================================================
    
    
    /// ===================================================
    // MARK: - BUTTON FUNCTIONS
    
    
    // Displays the sorting menu
    @IBAction func sortPopup(_ sender: UIButton) {
        performSegue(withIdentifier: "openSortPopup", sender: self)
    }
    
    
    // MARK: END
    /// ===================================================
}
