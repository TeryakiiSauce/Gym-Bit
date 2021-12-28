//
//  Colors.swift
//  Group3_WorkoutApp
//
//  Created by Ali Alqallaf on 14/12/2021.
//

import Foundation
import UIKit

struct AppColors {
    
    static var isDarkMode = false
    
    static var phoneBg = UIColor(red: 236/255, green: 239/255, blue: 244/255, alpha: 1) {
        didSet{
            if isDarkMode {
                phoneBg = UIColor(red: 26/255, green: 32/255, blue: 44/255, alpha: 1)
            }
        }
    }
    
    static var bodyBg = UIColor(red: 1, green: 1, blue: 1, alpha: 1) {
        didSet{
            if isDarkMode {
                bodyBg = UIColor(red: 45/255, green: 57/255, blue: 73/255, alpha: 1)
                print("")
            }
        }
    }
    
    static var secondaryColor = UIColor(red: 159/255, green: 159/255, blue: 159/255, alpha: 1) {
        didSet{
            if isDarkMode {
                secondaryColor = UIColor(red: 215/255, green: 221/255, blue: 233/255, alpha: 1)
            }
        }
    }
    
    static var textColor = UIColor(red: 46/255, green: 52/255, blue: 64/266, alpha: 1) {
        didSet{
            if isDarkMode {
                textColor = UIColor(red: 215/255, green: 221/255, blue: 233/255, alpha: 1)
            }
        }
    }
    
    static var buttonColor = UIColor(red: 136/255, green: 192/255, blue: 208/255, alpha: 1) {
        didSet{
            if isDarkMode {
                buttonColor = UIColor(red: 136/255, green: 192/255, blue: 208/255, alpha: 1)
            }
        }
    }
    
    
}
