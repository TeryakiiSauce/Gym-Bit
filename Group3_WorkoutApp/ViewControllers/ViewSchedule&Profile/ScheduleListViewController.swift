import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    //storing the table array
    var displayedSchedule = DefaultData.schedules
    //gui outlet connections
    @IBOutlet weak var headerView: UIView!
    @IBOutlet weak var bodyView: UIView!
    @IBOutlet weak var mainButton: UIButton!
    @IBOutlet weak var customTableView: UITableView!
    @IBOutlet weak var SecondayButton: UIButton!
    
    //view did load function
    override func viewDidLoad() {
        super.viewDidLoad()
        // apply default styling
        Constants.applyDefaultStyling(backgroundView: view, headerView: headerView, bodyView: bodyView, mainButton: mainButton, secondaryButton: SecondayButton)
        customTableView.delegate = self
        customTableView.dataSource = self
        //styling table view
        customTableView.separatorStyle = .none
        customTableView.showsVerticalScrollIndicator = false
    }
    
    //view will appear function
    override func viewWillAppear(_ animated: Bool) {
        customTableView.reloadData()
    }
    
    //function that prepares before moving to the next page
    override func prepare(for segue: UIStoryboardSegue, sender:Any?) {
        if segue.identifier == "createPage"{}
    }
    
    //function that is used when the unwind is called
    @IBAction func unwindtoViewSchedule(seague: UIStoryboardSegue){
        //checks if the unwind is from Create Schedule page
        if let sourceViewController = seague.source as? CreateScheduleViewController   {
            //updates the displayed schedule array
            displayedSchedule = displayedSchedule + [sourceViewController.displayedSchedule]
            //saving the schedule 
            Schedule.saveSchedules(displayedSchedule)
        }
    }
    
    //function that counts the number of rows
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return displayedSchedule.count
    }
    
    //function that sets the table data
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = customTableView.dequeueReusableCell(withIdentifier: "customCell") as! CustomTableViewCell
        cell.titleLabel.text = displayedSchedule[indexPath.row].name
        return cell
    }
    
    //function that sets the height of the table cells
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 110
    
    }
}
