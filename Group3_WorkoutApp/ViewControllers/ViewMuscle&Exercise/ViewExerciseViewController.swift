//
//  ViewExerciseViewController.swift
//  Group3_WorkoutApp
//
//  Created by mobileProg on 03/01/2022.
//

import UIKit

class ViewExerciseViewController: UIViewController,UITableViewDataSource, UITableViewDelegate {

    var mainImageIconName = ""
    var exersizeList : [Exercise]?
    
    //connectors connecting the gui to the code
    @IBOutlet weak var headerView: UIView!
    @IBOutlet weak var bodyView: UIView!
    @IBOutlet weak var customTableView: UITableView!
    @IBOutlet weak var IconImage: UIImageView!
    
    //function to transfer the infromation through seague to the next page
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //setting controller variable
        let viewController = segue.destination as! ViewDetailExerciseViewController
        let selectedCell = customTableView.indexPathForSelectedRow?.row
        
        viewController.imageName = (exersizeList?[selectedCell!].imagePath)!
        viewController.exDescription = (exersizeList?[selectedCell!].description)!
        viewController.exTips = (exersizeList?[selectedCell!].tips)!
        viewController.title = (exersizeList?[selectedCell!].name)!
        
    }
    
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
    
    override func viewWillAppear(_ animated: Bool) {
        getExercises(Type: mainImageIconName)
    }
    //view did load function
    override func viewDidLoad() {
        super.viewDidLoad()
        // apply default styling
        Constants.buildRoundedUIView(headerView: headerView, bodyView: bodyView, button:nil)
        customTableView.delegate = self
        customTableView.dataSource = self
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
        let cell = customTableView.dequeueReusableCell(withIdentifier: "customCell") as! CustomTableViewCell

        //adding data to the cell
        cell.titleLabel.text = exersizeList?[indexPath.row].name
        cell.cellImage.image = UIImage(named: exersizeList?[indexPath.row].imagePath ?? "")
        return cell
    }
    
    //function that sets the height of the table
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }

}
