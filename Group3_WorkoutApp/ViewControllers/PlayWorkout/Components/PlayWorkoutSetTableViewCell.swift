//
//  PlayWorkoutSetTableViewCell.swift
//  Group3_WorkoutApp
//
//  Created by Ali Alqallaf on 03/01/2022.
//

import UIKit
protocol SetCellDelegate: AnyObject {
    func setButtonTapped()
}
class PlayWorkoutSetTableViewCell: UITableViewCell {

    weak var delegate: SetCellDelegate?
    @IBOutlet weak var cellView: UIView!
    @IBOutlet weak var checkBoxImage: UIImageView!
    @IBOutlet weak var repsLabel: UILabel!
    @IBOutlet weak var cellTitle: UILabel!
    
    var isChecked = false
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // cell and view styling
        backgroundColor = AppColors.bodyBg

        cellView.layer.cornerRadius = Constants.viewRadius
        cellView.layer.borderColor = AppColors.secondaryColor.cgColor
        cellView.layer.borderWidth = 1
        cellView.backgroundColor = AppColors.bodyBg
        repsLabel.textColor = AppColors.textColor
        cellTitle.textColor = AppColors.textColor
        
        selectionStyle = .none
        
        // add gesture to the check box image
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(imageTapped(tapGestureRecognizer:)))
        checkBoxImage.isUserInteractionEnabled = true
        checkBoxImage.addGestureRecognizer(tapGestureRecognizer)
    }
    
    
    // check the image box
    @objc func imageTapped(tapGestureRecognizer: UITapGestureRecognizer)
    {
        if isChecked {
            checkBoxImage.image = UIImage(named: "unchecked_box")
        }else{
            checkBoxImage.image = UIImage(named: "checked_box")
        }
        
        isChecked.toggle()
        
        delegate?.setButtonTapped()
    }
    
    // reset check box
    func resetCell(){
        isChecked = false
        checkBoxImage.image = UIImage(named: "unchecked_box")
    }

}
