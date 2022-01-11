//
//  SortingPopupViewController.swift
//  Group3_WorkoutApp
//
//  Created by mobileProg on 07/01/2022.
//

import UIKit

class SortingPopupViewController: UIViewController {

    // MARK: - Outlets
    
    @IBOutlet weak var alphaLbl: UIButton!
    @IBOutlet weak var timesUsedLbl: UIButton!
    @IBOutlet weak var dateCreatedLbl: UIButton!
    @IBOutlet weak var orderBy: UISegmentedControl!
    @IBOutlet weak var submitBtn: UIButton!
    @IBOutlet weak var bgView: UIStackView!
    
    // MARK: END
    
    
    
    // MARK: - Screen loading functions
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.black.withAlphaComponent(0.3)
        
        // Sort Method
        if DefaultData.currSelectedSortOption == "alphabetical" {
            alphaLbl.setTitleColor(.systemRed, for: .normal)
            timesUsedLbl.setTitleColor(.systemBlue, for: .normal)
            dateCreatedLbl.setTitleColor(.systemBlue, for: .normal)
            
        } else if DefaultData.currSelectedSortOption == "timesUsed" {
            
            alphaLbl.setTitleColor(.systemBlue, for: .normal)
            timesUsedLbl.setTitleColor(.systemRed, for: .normal)
            dateCreatedLbl.setTitleColor(.systemBlue, for: .normal)
            
        } else if DefaultData.currSelectedSortOption == "dateCreated" {
            
            alphaLbl.setTitleColor(.systemBlue, for: .normal)
            timesUsedLbl.setTitleColor(.systemBlue, for: .normal)
            dateCreatedLbl.setTitleColor(.systemRed, for: .normal)
        }
        
        // Sort Order
        if DefaultData.ascOrDesc == "asc" {
            orderBy.selectedSegmentIndex = 0
        } else if DefaultData.ascOrDesc == "desc" {
            orderBy.selectedSegmentIndex = 1
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        let selectedSegmentFontColor = [NSAttributedString.Key.foregroundColor: AppColors.phoneBg]
        let unselectedSegmentFontColor = [NSAttributedString.Key.foregroundColor: AppColors.textColor]
        orderBy.setTitleTextAttributes(selectedSegmentFontColor, for: .selected)
        orderBy.setTitleTextAttributes(unselectedSegmentFontColor, for: .normal)
        orderBy.selectedSegmentTintColor = AppColors.buttonColor
        orderBy.setTitleTextAttributes([NSAttributedString.Key.font: UIFont.systemFont(ofSize: 14)], for: .normal)
        
        bgView.layer.cornerRadius = Constants.viewRadius
    }
    
    // MARK: END
    
    
    
    // MARK: - Button Actions
    
    @IBAction func AlphaBtn(_ sender: UIButton) {
        alphaLbl.setTitleColor(.systemRed, for: .normal)
        timesUsedLbl.setTitleColor(.systemBlue, for: .normal)
        dateCreatedLbl.setTitleColor(.systemBlue, for: .normal)
        
        DefaultData.currSelectedSortOption = "alphabetical"
        //print(DefaultData.currSelectedSortOption) // testing
    }
    
    @IBAction func TimesUsedBtn(_ sender: UIButton) {
        alphaLbl.setTitleColor(.systemBlue, for: .normal)
        timesUsedLbl.setTitleColor(.systemRed, for: .normal)
        dateCreatedLbl.setTitleColor(.systemBlue, for: .normal)
        
        DefaultData.currSelectedSortOption = "timesUsed"
        //print(DefaultData.currSelectedSortOption) // testing
    }
    
    @IBAction func DateCreatedBtn(_ sender: UIButton) {
        alphaLbl.setTitleColor(.systemBlue, for: .normal)
        timesUsedLbl.setTitleColor(.systemBlue, for: .normal)
        dateCreatedLbl.setTitleColor(.systemRed, for: .normal)
        
        DefaultData.currSelectedSortOption = "dateCreated"
        
        //print(DefaultData.currSelectedSortOption) // testing
    }
    
    @IBAction func submit(_ sender: UIButton) {
        print("selected: \(DefaultData.currSelectedSortOption) \(DefaultData.ascOrDesc)")
        self.view.removeFromSuperview()
        performSegue(withIdentifier: "returnToMainPage", sender: self)
    }
    
    // MARK: END
}
