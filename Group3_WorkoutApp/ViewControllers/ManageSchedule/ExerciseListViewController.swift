import UIKit

class ExerciseListViewController: UIViewController,UITableViewDataSource, UITableViewDelegate {

    //temp infromation
    var titles = ["Workout 1", "Workout 2", "Workout 3", "Workout 4"]
    var subtitles = ["abs workout 1", "abs workout 2", "abs workout 3", "abs workout 4"]
    var images = ["abs1", "abs2", "abs3", "abs4"]
    var mainImageIconName = ""
    
    //connectors connecting the gui to the code
    @IBOutlet weak var headerView: UIView!
    @IBOutlet weak var bodyView: UIView!
    @IBOutlet weak var mainButton: UIButton!
    @IBOutlet weak var customTableView: UITableView!
    @IBOutlet weak var IconImage: UIImageView!
    
    //function that preformes a segue when the save button is clicked
    @IBAction func clickSaveButton(_ sender: Any) {
        //segue command to send to create schedule page 
        performSegue(withIdentifier: "unwindToCreateSchedule", sender: self)
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
        IconImage.image = UIImage(named: mainImageIconName)
        print(mainImageIconName)
    }
    
    //function that sets the number of rows in the table
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return titles.count
    }
    
    //function that fill the table with infromation
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        //creating a cell identifier
        let cell = customTableView.dequeueReusableCell(withIdentifier: "customCell") as! CustomTableViewCell

        //adding data to the cell
        cell.titleLabel.text = titles[indexPath.row]
        cell.subtitleLabel.text = subtitles[indexPath.row]
        cell.cellImage.image = UIImage(named: images[indexPath.row])
        return cell
    }

    //function that sets the height of the table
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
