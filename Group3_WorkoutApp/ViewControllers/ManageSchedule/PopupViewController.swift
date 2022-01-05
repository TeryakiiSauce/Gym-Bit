import UIKit

class PopupViewController: UIViewController {
    
    //setting default varuables
    var isClearConfirmPressed = false
    var isLeaveConfirmPressed = false
    var isupdatePressed = false
    @IBOutlet weak var BodyView: UIView!
    
    //update schedule name popup gui outlets
    @IBOutlet weak var ScheduleNameTextField: UITextField!
    @IBOutlet weak var updatePopupStackView: UIStackView!
    @IBOutlet weak var UpdateScheduleMainButton: UIButton!
    @IBOutlet weak var errorLabel: UILabel!
    
    //action when update is clicked
    @IBAction func updateScheduleButton(_ sender: Any) {
        if ScheduleNameTextField.text == ""{
            errorLabel.text = "Schedule must have a name"
            ScheduleNameTextField.layer.borderWidth = 1
            ScheduleNameTextField.layer.borderColor = UIColor.red.cgColor
        }else{
            errorLabel.text = ""
            //discard page
            self.view.removeFromSuperview()
            isupdatePressed = true
            //preform segue to create schedule
            self.performSegue(withIdentifier: "unwindToCreateSchedule", sender: self)
        }
    }
    //clear table popup gui outlets
    @IBOutlet weak var ClearSecondButton: UIButton!
    @IBOutlet weak var ClearMainButton: UIButton!
    @IBOutlet weak var ClearLabel: UILabel!
    @IBOutlet weak var ClearPopupStackView: UIStackView!
    
    //action when cancel for the clear is clicked
    @IBAction func ClearCancelButtonClicked(_ sender: Any) {
        //discard page
        self.view.removeFromSuperview()
        //preform segue to create schedule
        self.performSegue(withIdentifier: "unwindToCreateSchedule", sender: self)
    }
    
    //action when clear button is clicked
    @IBAction func ClearConfirmButtonClicked(_ sender: Any) {
        //discard page
        self.view.removeFromSuperview()
        isClearConfirmPressed = true
        //preform segue to create schedule
        self.performSegue(withIdentifier: "unwindToCreateSchedule", sender: self)
    }
    
    //leave schedule popup gui outlets
    @IBOutlet weak var LeaveSecondButton: UIButton!
    @IBOutlet weak var LeaveMainButton: UIButton!
    @IBOutlet weak var LeaveLabel: UILabel!
    @IBOutlet weak var LeavePopupStackView: UIStackView!
    
    //action when cancel is clicked
    @IBAction func LeaveCancelButtonClicked(_ sender: Any) {
        //discard page
        self.view.removeFromSuperview()
        //preform segue to create schedule
        self.performSegue(withIdentifier: "unwindToCreateSchedule", sender: self)
    }
    
    //action when Leave button is clicked
    @IBAction func LeaveConfirmButtonClicked(_ sender: Any) {
        //discard page
        self.view.removeFromSuperview()
        isLeaveConfirmPressed = true
        //preform segue to view Schedule page
        self.performSegue(withIdentifier: "unwindToViewSchedule", sender: self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //setting the background to be dimmed when the page is up
        self.view.backgroundColor = UIColor.black.withAlphaComponent(0.6)
        //Methods used for styling
        Constants.applyDefaultStyling(backgroundView: nil, headerView: nil, bodyView: BodyView, mainButton: UpdateScheduleMainButton, secondaryButton: nil)
        Constants.applyDefaultStyling(backgroundView: nil, headerView: nil, bodyView: nil, mainButton: LeaveMainButton, secondaryButton: LeaveSecondButton)
        Constants.applyDefaultStyling(backgroundView: nil, headerView: nil, bodyView: nil, mainButton: ClearMainButton, secondaryButton: ClearSecondButton)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        //reseting the hidden views
        isClearConfirmPressed = false
        isLeaveConfirmPressed = false
        isupdatePressed = false
    }

}
