import UIKit

class PopupViewController: UIViewController {

    var isClearConfirmPressed = false
 
    var isLeaveConfirmPressed = false
    var isupdatePressed = false
    @IBOutlet weak var BodyView: UIView!
    @IBOutlet weak var returnButton: UIButton!
    @IBOutlet weak var ScheduleNameTextField: UITextField!
    @IBOutlet weak var updatePopupStackView: UIStackView!
    @IBAction func updateScheduleButton(_ sender: Any) {
        self.view.removeFromSuperview()
        isupdatePressed = true
        self.performSegue(withIdentifier: "unwindToCreateSchedule", sender: self)
    }
    
    
    @IBOutlet weak var ClearPopupStackView: UIStackView!
    @IBAction func ClearCancelButtonClicked(_ sender: Any) {
        self.view.removeFromSuperview()
        self.performSegue(withIdentifier: "unwindToCreateSchedule", sender: self)
    }
    @IBAction func ClearConfirmButtonClicked(_ sender: Any) {
        self.view.removeFromSuperview()
        isClearConfirmPressed = true
        self.performSegue(withIdentifier: "unwindToCreateSchedule", sender: self)
    }
    
    
    @IBOutlet weak var LeavePopupStackView: UIStackView!
    @IBAction func LeaveCancelButtonClicked(_ sender: Any) {
        self.view.removeFromSuperview()
        self.performSegue(withIdentifier: "unwindToCreateSchedule", sender: self)
    }
    @IBAction func LeaveConfirmButtonClicked(_ sender: Any) {
        self.view.removeFromSuperview()
        isLeaveConfirmPressed = true
        self.performSegue(withIdentifier: "unwindToViewSchedule", sender: self)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //setting the background to be dimmed when the page is up
        self.view.backgroundColor = UIColor.black.withAlphaComponent(0.6)
        //method that makes the views have round edges
        Constants.buildRoundedUIView(headerView: nil, bodyView: BodyView, button:returnButton)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        isClearConfirmPressed = false
      
        isLeaveConfirmPressed = false
        isupdatePressed = false
    }
    
    //method that updates the page
    

}
