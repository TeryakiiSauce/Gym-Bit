//
//  CreateScheduleViewController.swift
//  Group3_WorkoutApp
//
//  Created by mobileProg on 27/12/2021.
//

import UIKit

class CreateScheduleViewController: UIViewController,UITableViewDataSource, UITableViewDelegate {

    var titles = ["Workout 1", "Workout 2", "Workout 3", "Workout 4"]
    var subtitles = ["Legs workout 1", "Back workout 2", "Chest workout 3", "abs workout 4"]
    var images = ["abs1", "abs2", "abs3", "abs4"]
    
    @IBOutlet weak var headerView: UIView!
    @IBOutlet weak var bodyView: UIView!
    @IBOutlet weak var mainButton: UIButton!
    @IBOutlet weak var customTableView: UITableView!
    @IBOutlet weak var IconImage: UIImageView!
    
    @IBAction func ClickClearScheduleButton(_ sender: Any) {
    }
    @IBAction func ClickAddSchedulebutton(_ sender: Any) {
    }
    
    @IBAction func ClickSaveButton(_ sender: Any) {
    }
    //method to open a popup and change schedule name
    @IBAction func ClickUpdateScheduleButton(_ sender: Any) {
        
        //creating a var of the popup viewcontroller
        let popOverVc = UIStoryboard(name: "ManageSchedule", bundle: nil).instantiateViewController(withIdentifier: "sbPopupID") as! PopupViewController
        
        //assigning it as a child view and opening it over the parent view
        self.addChild(popOverVc)
        popOverVc.view.frame = self.view.frame
        self.view.addSubview(popOverVc.view)
        popOverVc.didMove(toParent: self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // apply default styling
        Constants.buildRoundedUIView(headerView: headerView, bodyView: bodyView, button:mainButton)
        customTableView.delegate = self
        customTableView.dataSource = self
        //styling table view
        customTableView.separatorStyle = .none
        customTableView.showsVerticalScrollIndicator = false
  
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return titles.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        //creating a cell identifier
        let cell = customTableView.dequeueReusableCell(withIdentifier: "customCell") as! CustomTableViewCell

        
        
        
        //adding data to the cell
        cell.titleLabel.text = titles[indexPath.row]
        cell.subtitleLabel.text = subtitles[indexPath.row]
        cell.cellImage.image = UIImage(named: images[indexPath.row])
        
        return cell
    }

    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }

    //makes it so that you can swipe to delete
    // Override to support editing the table view.
     func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            titles.remove(at: indexPath.row)
            images.remove(at: indexPath.row)
            subtitles.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
}
