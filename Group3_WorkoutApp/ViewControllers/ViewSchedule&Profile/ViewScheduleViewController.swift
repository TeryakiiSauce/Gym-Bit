import UIKit

class ViewScheduleViewController: UIViewController,UITableViewDataSource, UITableViewDelegate {
    
    
    /// ===================================================
    // MARK: - DEFAULT VALUES VARIABLES
    
    // Schedule clicked on; not necessarily the activated one
    var selectedSchedule = Schedule(dateCreated: Date(), name: "", playsCounter: nil, exercises: [])
    
    // The activated schedule that should loaded from local storage
    var activatedSchedule = Schedule.getActivatedSchedule()
    
    // MARK: END
    /// ===================================================
    
    
    /// ===================================================
    // MARK: - SCREEN BUTTON VARIABLES
    
    
    @IBOutlet weak var headerView: UIView!
    @IBOutlet weak var bodyView: UIView!
    @IBOutlet weak var mainBtn: UIButton!
    @IBOutlet weak var customTableView: UITableView!
    @IBOutlet weak var scheduleName: UILabel!
    @IBOutlet weak var dateLbl: UILabel!
    
    
    // MARK: END
    /// ===================================================
    
    
    /// ===================================================
    // MARK: - SCREEN LOADING FUNCTIONS
    
        
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Apply styling on load
        customTableView.delegate = self
        customTableView.dataSource = self
        
        customTableView.separatorStyle = .none
        customTableView.showsVerticalScrollIndicator = false
        
        Constants.applyDefaultStyling(backgroundView: view, headerView: headerView, bodyView: bodyView, mainButton: mainBtn, secondaryButton: .none)
        
        // Cell Info
        scheduleName.text = selectedSchedule.name
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMM d, yyyy"
        dateLbl.text = dateFormatter.string(from: selectedSchedule.dateCreated)
        
        // Check if currently selected schedule is activated or not
        print("currently activated schedule = \(activatedSchedule.name)")
        print("the selected schedule = \(selectedSchedule.name)")
        
        if selectedSchedule.name == activatedSchedule.name {
            mainBtn.setTitle("Currently Activated", for: .normal)
            mainBtn.backgroundColor = .lightGray
            mainBtn.isEnabled = false
            
        } else {
            mainBtn.isEnabled = true
            mainBtn.setTitle("Set as Active", for: .normal)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "editSchedule" {
            let viewController = segue.destination as! CreateScheduleViewController
            viewController.displayedSchedule = selectedSchedule
            viewController.isEditingSchedule = true
            viewController.orgScheduleTitle = selectedSchedule.name
        }
    }
    
    // MARK: END
    /// ===================================================
    
    
    /// ===================================================
    // MARK: - TABLE VIEW FUNCTIONS
    
    
    // Set number of rows in the exercises table
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return selectedSchedule.exercises.count
    }
    
    // Fills the table with exercises
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = customTableView.dequeueReusableCell(withIdentifier: "customCell") as! CustomTableViewCell
        
        // Data to add in the cell
        cell.titleLabel.text = selectedSchedule.exercises[indexPath.row].name
        cell.subtitleLabel.text = selectedSchedule.exercises[indexPath.row].targetMuscle
        cell.cellImage.image = UIImage(named: selectedSchedule.exercises[indexPath.row].imagePath)
        
        return cell
    }
    
    // Set row height for the cells
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
    
    
    // MARK: END
    /// ===================================================
    
    
    /// ===================================================
    // MARK: - BUTTON FUNCTIONS
    
    
    @IBAction func setActiveSchedule(_ sender: UIButton) {
        Schedule.saveActivatedSchedule(selectedSchedule)
        
        DefaultData.user.activeSchedule = Schedule.getActivatedSchedule()
        print("\"\(Schedule.getActivatedSchedule().name)\" has been activated.")
        
        // Returns back
        _ = navigationController?.popViewController(animated: true)
    }
    
    
    // MARK: END
    /// ===================================================
}
