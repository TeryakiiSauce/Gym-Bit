//
//  SortingPopupViewController.swift
//  Group3_WorkoutApp
//
//  Created by mobileProg on 07/01/2022.
//

import UIKit

class SortingPopupViewController: UIViewController {

    @IBOutlet weak var alphaLbl: UIButton!
    @IBOutlet weak var timesUsedLbl: UIButton!
    @IBOutlet weak var dateCreatedLbl: UIButton!
    @IBOutlet weak var orderBy: UISegmentedControl!
    @IBOutlet weak var submitBtn: UIButton!
    
    
    
    
    
    // GENERATED FUNCTIONS //
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Loads the previously selected/ default sorting method
        
        print("loaded: \(DefaultData.currSelectedSortOption)")
        print("loaded: \(DefaultData.ascOrDesc)")
        
        
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
        print("selected: \(DefaultData.currSelectedSortOption)")
        print("selected \(DefaultData.ascOrDesc)")
    }
    
    
    
    
    
    
    
    
    // CUSTOM FUNCTIONS //
    
    
    
    
    
    // Should update the schdules sort order in the previous screen
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let dest = segue.destination as! ViewController
        
        if orderBy.selectedSegmentIndex == 0 {
            DefaultData.ascOrDesc = "asc"
        } else if orderBy.selectedSegmentIndex == 1 {
            DefaultData.ascOrDesc = "desc"
        }
        
        if DefaultData.ascOrDesc == "asc" {
            dest.schedulesListArr = dest.schedulesListArr.sorted(by: <)
            
        } else if DefaultData.ascOrDesc == "desc" {
            // Makes it in asc order and then reverses it so that there is less to code
            dest.schedulesListArr = dest.schedulesListArr.sorted(by: <)
            
            dest.schedulesListArr = dest.schedulesListArr.reversed()
        }
    }
}
