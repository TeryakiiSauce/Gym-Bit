//
//  PlayWorkoutSetTableViewCell.swift
//  Group3_WorkoutApp
//
//  Created by Ali Alqallaf on 03/01/2022.
//

import UIKit

class PlayWorkoutSetTableViewCell: UITableViewCell {

    @IBOutlet weak var cellView: UIView!
    @IBOutlet weak var checkBoxImage: UIImageView!
    
    var isChecked = false
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        cellView.layer.cornerRadius = Constants.viewRadius
        cellView.layer.borderColor = AppColors.secondaryColor.cgColor
        cellView.layer.borderWidth = 1
        
        selectionStyle = .none

        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(imageTapped(tapGestureRecognizer:)))
        checkBoxImage.isUserInteractionEnabled = true
        checkBoxImage.addGestureRecognizer(tapGestureRecognizer)
    }

    @objc func imageTapped(tapGestureRecognizer: UITapGestureRecognizer)
    {
        if isChecked {
            checkBoxImage.image = UIImage(named: "unchecked_box")
        }else{
            checkBoxImage.image = UIImage(named: "checked_box")
        }
        
        isChecked.toggle()
    }

}
