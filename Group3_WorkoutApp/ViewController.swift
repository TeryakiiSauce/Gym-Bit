//
//  ViewController.swift
//  Group3_WorkoutApp
//
//  Created by Ali Alqallaf on 13/12/2021.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var headerView: UIView!
    @IBOutlet weak var bodyView: UIView!
    @IBOutlet weak var mainButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    
        Constants.buildRoundedUIView(headerView: headerView, bodyView: bodyView, button:mainButton )
    }




    
   
    
}

