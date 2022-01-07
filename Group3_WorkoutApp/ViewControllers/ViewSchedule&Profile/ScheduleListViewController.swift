import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    // Default Schedule Array
    var displayedSchedule = DefaultData.schedules
    
    @IBOutlet weak var headerView: UIView!
    @IBOutlet weak var bodyView: UIView!
    @IBOutlet weak var mainButton: UIButton!
    @IBOutlet weak var customTableView: UITableView!
    @IBOutlet weak var SecondayButton: UIButton!
    @IBOutlet weak var dateLbl: UILabel!
    
    
    
    
    
    
    // GENERATED FUNCTIONS //
    
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
    
    
    override func viewWillAppear(_ animated: Bool) {
        customTableView.reloadData()
    }
    
    // Prepares before moving to the next page
    override func prepare(for segue: UIStoryboardSegue, sender:Any?) {
        if segue.identifier == "viewScheduleLink" {
            let viewController = segue.destination as! ViewScheduleViewController
            let selectedCell = customTableView.indexPathForSelectedRow?.row
            viewController.displayedSchedule = self.displayedSchedule[selectedCell!]
        }
    }
    
    // Things to do done when "unwind" is called by "Create Schedule"
    @IBAction func unwindtoViewSchedule(seague: UIStoryboardSegue){
        if let sourceViewController = seague.source as? CreateScheduleViewController   {
            // Updates the displayed schedule array
            displayedSchedule = displayedSchedule + [sourceViewController.displayedSchedule]
            // Saving the schedule
            Schedule.saveSchedules(displayedSchedule)
        }
    }
    
    // Returns the number of rows in the Schedules list
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return displayedSchedule.count
    }
    
    // Sets the table data
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = customTableView.dequeueReusableCell(withIdentifier: "customCell") as! CustomTableViewCell
        cell.titleLabel.text = displayedSchedule[indexPath.row].name
        return cell
    }
    
    // Sets the row height
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 110
    
    }
    
    
    
    
    
    
    // Displays the sorting menu
    @IBAction func sortPopup(_ sender: UIButton) {
        performSegue(withIdentifier: "openSortPopup", sender: self)
    }
}
