import UIKit

class ExerciseListViewController: UIViewController,UITableViewDataSource, UITableViewDelegate {
    
    //creating page vars
    var mainImageIconName = ""
    var exersizeList : [Exercise]?
    var pickedExercises : [Exercise] = []
    
    //connectors connecting the gui to the code
    @IBOutlet weak var headerView: UIView!
    @IBOutlet weak var bodyView: UIView!
    @IBOutlet weak var mainButton: UIButton!
    @IBOutlet weak var customTableView: UITableView!
    @IBOutlet weak var IconImage: UIImageView!
    
    //function that gets the exercises by an inputed string and sets them in exercise list
    func getExercises(Type:String){
        switch Type {
        case "Chest":
            exersizeList = DefaultData.chestExercises
        case "Legs":
            exersizeList = DefaultData.legExercises
        case "Abs":
            exersizeList = DefaultData.absExercises
        case "Triceps":
            exersizeList = DefaultData.tricepExercises
        case "Biceps":
            exersizeList = DefaultData.bicepExercises
        case "Back":
            exersizeList = DefaultData.backExercises
        default:
            exersizeList = DefaultData.shoulderExercises
        }
    }
    
    //function that preformes a segue when the save button is clicked
    @IBAction func clickSaveButton(_ sender: Any) {}
    
    //view will appear function
    override func viewWillAppear(_ animated: Bool) {
        //getting the exercise for the page
        getExercises(Type: mainImageIconName)
    }
    
    //view did load function
    override func viewDidLoad() {
        super.viewDidLoad()
        // apply default styling
        Constants.buildRoundedUIView(headerView: headerView, bodyView: bodyView, button:mainButton)
        customTableView.delegate = self
        customTableView.dataSource = self
        //allowing the user to multicelect the cell 
        customTableView.allowsMultipleSelection = true
        //styling table view
        customTableView.separatorStyle = .none
        customTableView.showsVerticalScrollIndicator = false
        IconImage.image = UIImage(named: mainImageIconName)
    }
    
    //function that sets the number of rows in the table
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return exersizeList?.count ?? 0
    }
    
    //function that fill the table with infromation
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //creating a cell identifier
        let cell = customTableView.dequeueReusableCell(withIdentifier: "customCell") as! ExerciseTableViewCell
        //adding data to the cell
        cell.titleLabel.text = exersizeList?[indexPath.row].name
        cell.subtitleLabel.text = "\(exersizeList?[indexPath.row].reps ?? 10) reps x \(exersizeList?[indexPath.row].sets ?? 3) sets"
        cell.cellImage.image = UIImage(named: exersizeList?[indexPath.row].imagePath ?? "")
        return cell
    }
    
    //method that checkes if the user selects a cell and adds it to the pickedexercises array
    func tableView(_ tableView: UITableView, didSelectRowAt : IndexPath) {
        let addedcell = exersizeList?[didSelectRowAt.row]
        pickedExercises.append(addedcell!)
    }
    
    //method that checkes if the user deselects a cell and removes it from the pickedexercises array
    func tableView(_ tableView: UITableView, didDeselectRowAt : IndexPath) {
        let removecell = exersizeList?[didDeselectRowAt.row]
        //finding the index of the deselected array so that it could be removed
        let index = pickedExercises.firstIndex(where:{$0.name == removecell?.name})
            pickedExercises.remove(at: index!)
    }
    
    //function that sets the height of the table
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
}
