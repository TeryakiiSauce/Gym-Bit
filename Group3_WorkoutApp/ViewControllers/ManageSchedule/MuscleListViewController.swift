import UIKit

class MuscleListViewController: UIViewController,UITableViewDataSource, UITableViewDelegate  {

    //temp infromation
    let cellImageArray = ["abs","back","biceps","chest","legs","shoulders","triceps"]
    let cellNameArray = ["Abs","Back","Biceps","Chest","Legs","Shoulders","Triceps"]
    //connectors connecting gui to code
    @IBOutlet weak var bodyView: UIView!
    @IBOutlet weak var customTableView: UITableView!
    
    //function to transfer the infromation through seague to the next page
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //setting controller variable
        let viewController = segue.destination as! ExerciseListViewController
        let selectedCell = customTableView.indexPathForSelectedRow?.row
        //setting the image on the next page as the selected image picture
        viewController.mainImageIconName = cellImageArray[selectedCell!]
    }
    
    //function that resets the table whenever the page appears
    override func viewWillAppear(_ animated: Bool) {
        customTableView.reloadData()
    }
    
    //view did load function
    override func viewDidLoad() {
        super.viewDidLoad()
        // apply default styling
        Constants.buildRoundedUIView(headerView: nil, bodyView: bodyView, button:nil)
        customTableView.delegate = self
        customTableView.dataSource = self
        //styling table view
        customTableView.separatorStyle = .none
        customTableView.showsVerticalScrollIndicator = false
    }
    
    //sets the number of rows in the table
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 7
    }
    
    //function that fills the table
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //creating a cell identifier
        let cell = customTableView.dequeueReusableCell(withIdentifier: "customCell") as! CustomTableViewCell
        //adding data to the cell
        cell.titleLabel.text = cellNameArray[indexPath.row]
        cell.cellImage.image = UIImage(named: cellImageArray[indexPath.row])
        return cell
    }

    //function that sets the cell height
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }

    
}
