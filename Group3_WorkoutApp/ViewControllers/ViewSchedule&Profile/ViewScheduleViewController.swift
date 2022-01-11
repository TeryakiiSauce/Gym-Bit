import UIKit

class ViewScheduleViewController: UIViewController,UITableViewDataSource, UITableViewDelegate {
    
    
    /// ===================================================
    // MARK: - DEFAULT VALUES VARIABLES
    
    
    var selectedSchedule = Schedule(dateCreated: Date(), name: "", playsCounter: nil, exercises: [])
    var selectedScheduleIndex = 0
    
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
        
        
        //print("currently activated schedule = \(DefaultData.activatedSchedule)")
        
        if DefaultData.activatedSchedule == selectedSchedule.name {
            mainBtn.setTitle("Currently Activated", for: .normal)
            mainBtn.backgroundColor = .lightGray
            mainBtn.isEnabled = false
        } else {
            mainBtn.isEnabled = true
            mainBtn.setTitle("Set as Active", for: .normal)
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
        DefaultData.activatedSchedule = selectedSchedule.name
        DefaultData.activatedScheduleIndex = selectedScheduleIndex
        mainBtn.setTitle("Currently Activated", for: .normal)
        mainBtn.backgroundColor = .lightGray
        mainBtn.isEnabled = false
        
        // Save the activated schedule title and index
        let dictionary = UserDefaults.standard
        dictionary.set(DefaultData.activatedSchedule, forKey: "activatedSchedule")
        dictionary.set(DefaultData.activatedScheduleIndex, forKey: "activatedScheduleIndex")
        DefaultData.user.activeSchedule = Schedule.getSchedules()[DefaultData.activatedScheduleIndex]
        print("\"\(DefaultData.activatedSchedule)\" has been activated.")
    }
    
    
    // MARK: END
    /// ===================================================
}
