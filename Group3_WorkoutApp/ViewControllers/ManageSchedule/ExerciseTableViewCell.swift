//
//  ExerciseTableViewCell.swift
//  Group3_WorkoutApp
//
//  Created by mobileProg on 02/01/2022.
//

import UIKit

class ExerciseTableViewCell: UITableViewCell {

    @IBOutlet weak var cellView: UIView!
    @IBOutlet weak var cellImage: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subtitleLabel: UILabel!
    
     var cellIsSelected = false
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        cellView.layer.cornerRadius = Constants.viewRadius
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
        selectedCell()
        }
    
     func selectedCell(){
        if self.cellIsSelected == true{
            cellView.layer.borderColor = AppColors.buttonColor.cgColor
            cellView.layer.borderWidth = 3
            let bgColorView = UIView()
            bgColorView.backgroundColor = AppColors.bodyBg
            self.selectedBackgroundView = bgColorView
            self.cellIsSelected.toggle()
            
        }else{
            cellView.layer.borderColor = AppColors.secondaryColor.cgColor
            cellView.layer.borderWidth = 1
            self.cellIsSelected.toggle()
        }
    }
    
}


