//
//  CustomTableViewCell.swift
//  Group3_WorkoutApp
//
//  Created by Ali Alqallaf on 27/12/2021.
//

import UIKit

class CustomTableViewCell: UITableViewCell {

    @IBOutlet weak var cellView: UIView!
    @IBOutlet weak var cellImage: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subtitleLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code

        cellView.layer.borderColor = AppColors.secondaryColor.cgColor
        cellView.layer.borderWidth = 1
        cellView.layer.cornerRadius = Constants.viewRadius
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }



}
