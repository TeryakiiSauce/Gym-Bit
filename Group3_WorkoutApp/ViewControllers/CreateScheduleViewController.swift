//
//  CreateScheduleViewController.swift
//  Group3_WorkoutApp
//
//  Created by mobileProg on 27/12/2021.
//

import UIKit

class CreateScheduleViewController: UIViewController,UITableViewDataSource, UITableViewDelegate {

    let titles = ["Workout 1", "Workout 2", "Workout 3", "Workout 4"]
    let subtitles = ["Legs workout 1", "Back workout 2", "Chest workout 3", "abs workout 4"]
    let images = ["abs1", "abs2", "abs3", "abs4"]
    
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
        let cell = customTableView.dequeueReusableCell(withIdentifier: "customCell") as! CustomTableViewCell
        
        cell.titleLabel.text = titles[indexPath.row]
        cell.subtitleLabel.text = subtitles[indexPath.row]
        cell.cellImage.image = UIImage(named: images[indexPath.row])
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }

}
