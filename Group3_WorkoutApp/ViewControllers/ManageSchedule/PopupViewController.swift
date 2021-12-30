import UIKit

class PopupViewController: UIViewController {

    @IBOutlet weak var BodyView: UIView!
    @IBOutlet weak var returnButton: UIButton!
    @IBOutlet weak var ScheduleNameTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //setting the background to be dimmed when the page is up
        self.view.backgroundColor = UIColor.black.withAlphaComponent(0.6)
        //method that makes the views have round edges
        Constants.buildRoundedUIView(headerView: nil, bodyView: BodyView, button:returnButton)
    }
    
    //method that updates the page
    @IBAction func updateScheduleButton(_ sender: Any) {
        self.view.removeFromSuperview()
    }

}
