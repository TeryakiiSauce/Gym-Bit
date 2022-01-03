//
//  PlayWorkoutViewController.swift
//  Group3_WorkoutApp
//
//  Created by Ali Alqallaf on 03/01/2022.
//

import UIKit

class PlayWorkoutViewController: UIViewController {

    
        
    @IBOutlet weak var headerView: UIView!
    @IBOutlet weak var bodyView: UIView!
    @IBOutlet weak var mainButton: UIButton!
//    @IBOutlet weak var customTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // apply default styling
        Constants.applyDefaultStyling(backgroundView: view, headerView: headerView, bodyView: bodyView, mainButton: mainButton, secondaryButton: nil)

        //styling table view
//        customTableView.separatorStyle = .none
//        customTableView.showsVerticalScrollIndicator = false
        
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
    

}
