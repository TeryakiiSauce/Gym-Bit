//
//  QuizViewController.swift
//  Group3_WorkoutApp
//
//  Created by Albaraa Mohammed Janahi  on 03/01/2022.
//

import UIKit

class QuizViewController: UIViewController {

    @IBOutlet weak var bodyView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        Constants.applyDefaultStyling(backgroundView: view, headerView: nil, bodyView: bodyView, mainButton: nil, secondaryButton: nil)
        bodyView.backgroundColor = AppColors.bodyBg
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
