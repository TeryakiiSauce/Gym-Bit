import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    
    /// ===================================================
    // MARK: - DEFAULT VALUES VARIABLES
    
    
    var schedulesListArr = Schedule.getSchedules()
    var activatedSchedule = Schedule.getActivatedSchedule()
    
    
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

        customTableView.delegate = self
        customTableView.dataSource = self
        
        // Table view styling
        customTableView.separatorStyle = .none
        customTableView.showsVerticalScrollIndicator = false
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMM d, yyyy"
        dateLbl.text = "Date Today: \(dateFormatter.string(from: Date()))"
        
        DefaultData.user.activeSchedule = activatedSchedule
        
        // Updates the header title
        if DefaultData.user.activeSchedule?.name == "" {
            activatedScheduleLbl.text = "None"
        } else {
            activatedScheduleLbl.text = DefaultData.user.activeSchedule?.name
        }
    }
    
    // Updates the view whenever the screen appears
    override func viewWillAppear(_ animated: Bool) {
        customTableView.reloadData()
        
        Constants.applyDefaultStyling(backgroundView: view, headerView: headerView, bodyView: bodyView, mainButton: mainButton, secondaryButton: SecondayButton)
        
        // Print the selected/ default sorting method
        print("sort method loaded: \(DefaultData.currSelectedSortOption) \(DefaultData.ascOrDesc)")
        
        if DefaultData.ascOrDesc == "asc" {
            schedulesListArr = schedulesListArr.sorted(by: <)
            
            Schedule.saveSchedules(schedulesListArr)
            
        } else if DefaultData.ascOrDesc == "desc" {
            // Makes it in asc order and then reverses it so that there is less to code [work smarter, not harder *winks*]
            schedulesListArr = schedulesListArr.sorted(by: <)
            schedulesListArr = schedulesListArr.reversed()
            
            Schedule.saveSchedules(schedulesListArr)
        }
        
        // Updates the header title
        if DefaultData.user.activeSchedule?.name == "" {
            activatedScheduleLbl.text = "None"
        } else {
            activatedScheduleLbl.text = DefaultData.user.activeSchedule?.name
        }
                
        // So that the schedule array & activated schedule are always up-to-date
        schedulesListArr = Schedule.getSchedules()
        activatedSchedule = Schedule.getActivatedSchedule()
    }
    
    
    // MARK: END
    /// ===================================================
    
    
    /// ===================================================
    // MARK: - NAVIGATION CONTROL FUNCTIONS
    
    
    // Passes the selected schedule and prepares the next page [View Schedule]
    override func prepare(for segue: UIStoryboardSegue, sender:Any?) {
        if segue.identifier == "viewScheduleLink" {
            let viewCurrScheduleScreen = segue.destination as! ViewScheduleViewController
            
            if let selectedScheduleIndex = customTableView.indexPathForSelectedRow?.row {
                
                viewCurrScheduleScreen.selectedSchedule = schedulesListArr[selectedScheduleIndex]
            }
        } else if segue.identifier == "createPage" {
            let viewController = segue.destination as! CreateScheduleViewController
            viewController.isEditingSchedule = false
        }
    }
    
    // UNWINDING
    @IBAction func unwindtoViewSchedule(seague: UIStoryboardSegue){
        // EDIT: Saves the schedules
        // Things to do done when "unwind" is called by "Create Schedule (Aziz)"
        if let sourceViewController = seague.source as? CreateScheduleViewController   {
            if sourceViewController.isEditingSchedule == true {
                var position = 0
                for schedule in schedulesListArr {
                    if schedule.name == sourceViewController.orgScheduleTitle {
                        break
                    }
                    position += 1
                }
                
                schedulesListArr[position] = sourceViewController.displayedSchedule
                
            } else {
                // Updates the displayed schedule array
                schedulesListArr = schedulesListArr + [sourceViewController.displayedSchedule]
                
                // Updates Schedule List Array
                Schedule.saveSchedules(schedulesListArr)
            }
            
        }
        
        if let sortSourceViewController = seague.source as? SortingPopupViewController {
            if sortSourceViewController.orderBy.selectedSegmentIndex == 0 {
                DefaultData.ascOrDesc = "asc"
            } else if sortSourceViewController.orderBy.selectedSegmentIndex == 1 {
                DefaultData.ascOrDesc = "desc"
            }
            
            if DefaultData.ascOrDesc == "asc" {
                schedulesListArr = schedulesListArr.sorted(by: <)
                
            } else if DefaultData.ascOrDesc == "desc" {
                // Makes it in asc order and then reverses it so that there is less to code
                schedulesListArr = schedulesListArr.sorted(by: <)
                
                schedulesListArr = schedulesListArr.reversed()
            }
            
            customTableView.reloadData()
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
        
        if schedule.name == activatedSchedule.name {
            //print("show image for \(schedule.name)")
            
            cell.cellImage.image = UIImage(named: "activated_icon")
        } else {
            cell.cellImage.image = UIImage(named: "deactivated_icon")
        }
        
        return cell
    }
    
    // Sets the row height
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 110
    }
    
    // Slide to delete
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        var safeToDelete = true
        
        // Should display an alert informing the user to NOT delete the activated schedule to avoid bugs
        if schedulesListArr[indexPath.row].name == activatedSchedule.name {
            let alertView = UIAlertController(title: "ERROR", message: "Cannot delete activated schedule!", preferredStyle: .alert)
            
            alertView.addAction(UIAlertAction(title: "Return", style: .destructive, handler: { (action: UIAlertAction!) in
                safeToDelete = false
            }))
            present(alertView, animated: true, completion: nil)
            
        } else if safeToDelete == true && editingStyle == .delete {
            let alertView = UIAlertController(title: "WARNING", message: "Are you sure you want to continue?", preferredStyle: .alert)
            
            alertView.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: { (action: UIAlertAction!) in
                safeToDelete = false
            }))
            
            alertView.addAction(UIAlertAction(title: "Delete", style: .destructive, handler: { (action: UIAlertAction!) in
                safeToDelete = true
                
                self.schedulesListArr.remove(at: indexPath.row) // remove from array
                tableView.deleteRows(at: [indexPath], with: .fade) // remove from screen
                
                Schedule.saveSchedules(self.schedulesListArr) // Updates Schedule List Array
            }))
            
            present(alertView, animated: true, completion: nil)
        }
    }
    
    // MARK: END
    /// ===================================================
    
    
    /// ===================================================
    // MARK: - BUTTON FUNCTIONS
    
    
    // Displays the sorting menu
    @IBAction func sortPopup(_ sender: UIButton) {
        //performSegue(withIdentifier: "openSortPopup", sender: self)
        
        openPopupPage()
    }
    
    //function that creates an instance of popup page viewcontreoller and returns it
    func openPopupPage() {
        let popOverVc = UIStoryboard(name: "ViewSchedule", bundle: nil).instantiateViewController(withIdentifier: "sortPopupVC") as! SortingPopupViewController
        //assigning it as a child view and opening it over the parent view
        self.addChild(popOverVc)
        popOverVc.view.frame = self.view.frame
        self.view.addSubview(popOverVc.view)
        popOverVc.didMove(toParent: self)
    }
    
    // MARK: END
    /// ===================================================
}
