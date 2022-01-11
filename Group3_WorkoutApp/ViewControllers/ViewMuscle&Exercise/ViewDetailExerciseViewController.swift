//
//  ViewDetailExerciseViewController.swift
//  Group3_WorkoutApp
//
//  Created by mobileProg on 04/01/2022.
//

import UIKit

class ViewDetailExerciseViewController: UIViewController {

    //connectors connecting the gui to the code
    @IBOutlet weak var exerciseImage: UIImageView!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var tipsLabel: UILabel!
    @IBOutlet weak var bodyView: UIView!
    @IBOutlet weak var tipsView: UIView!
    @IBOutlet weak var descView: UIView!
    
    //variables to store in the data from segue
    var imageName = ""
    var exDescription = ""
    var exTips : [String] = []
    
    //view did load function
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //setting the page with the correct details
        exerciseImage.image = UIImage(named: imageName)
        getDescription()
        getTips()

    }
    
    override func viewWillAppear(_ animated: Bool) {
        //apply default styling
        Constants.applyDefaultStyling(backgroundView: view, headerView: nil, bodyView: bodyView, mainButton: nil, secondaryButton: nil, vc: self)
        setViewsBroder()
    }
    
    func setViewsBroder()
    {
        descView.layer.borderWidth = 1
        descView.layer.borderColor = AppColors.secondaryColor.cgColor
        descView.layer.cornerRadius = Constants.viewRadius
        descView.layer.backgroundColor = AppColors.bodyBg.cgColor
        tipsView.layer.borderWidth = 1
        tipsView.layer.borderColor = AppColors.secondaryColor.cgColor
        tipsView.layer.cornerRadius = Constants.viewRadius
        tipsView.layer.backgroundColor = AppColors.bodyBg.cgColor
    }
    
    //function to prepare the Tips with the bullet points
    func getTips()
    {
        //Title
        tipsLabel.text = ""
        
        //Loop through array for each tip
        for x in exTips
        {
            //This will add a bullet point
            tipsLabel.text?.append("\u{2022} ")
            tipsLabel.text?.append(x)
            tipsLabel.text?.append("\n")
        }
    }
    
    //function to prepare description
    func getDescription()
    {
        //Setting up the title and details
        descriptionLabel.text = exDescription
    }

}
