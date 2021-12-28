//
//  TemplateScreenViewController.swift
//  Group3_WorkoutApp
//
//  Created by Ali Alqallaf on 27/12/2021.
//

import UIKit

class TemplateScreenViewController: UIViewController,UITableViewDataSource, UITableViewDelegate {

        let titles = ["Abs 1", "Abs 2", "Abs 3", "Abs 4"]
        let subtitles = ["abs workout 1", "abs workout 2", "abs workout 3", "abs workout 4"]
        let images = ["abs1", "abs2", "abs3", "abs4"]
        
        @IBOutlet weak var headerView: UIView!
        @IBOutlet weak var bodyView: UIView!
        @IBOutlet weak var mainButton: UIButton!
        @IBOutlet weak var customTableView: UITableView!
        
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
            
            let bgColorView = UIView()
            bgColorView.backgroundColor = AppColors.bodyBg
            cell.selectedBackgroundView = bgColorView
            cell.titleLabel.text = titles[indexPath.row]
            cell.subtitleLabel.text = subtitles[indexPath.row]
            cell.cellImage.image = UIImage(named: "play")
            return cell
        }
        
        
        func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
            return 120
        }
        

}
