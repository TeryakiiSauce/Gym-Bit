//
//  PlayWorkoutSetTableViewCell.swift
//  Group3_WorkoutApp
//
//  Created by Ali Alqallaf on 03/01/2022.
//

import UIKit

class PlayWorkoutSetTableViewCell: UITableViewCell {

    @IBOutlet weak var cellView: UIView!
    @IBOutlet weak var checkImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        cellView.layer.cornerRadius = Constants.viewRadius
        cellView.layer.borderColor = AppColors.secondaryColor.cgColor
        cellView.layer.borderWidth = 1
        
        selectionStyle = .none

    }


}
