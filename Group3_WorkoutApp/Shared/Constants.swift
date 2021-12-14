
import Foundation
import UIKit

struct Constants {
    
    static let viewRadius : CGFloat = 10
    
    
    static func buildRoundedUIView(headerView: UIView?, bodyView: UIView?, button: UIButton?){
        
        
        
        if let headerView = headerView {
            headerView.layer.cornerRadius = Constants.viewRadius
            headerView.layer.masksToBounds = true
            
            headerView.layer.maskedCorners = [.layerMaxXMaxYCorner, .layerMaxXMinYCorner]
        }
        
        if let bodyView = bodyView {
            bodyView.layer.cornerRadius = Constants.viewRadius
            bodyView.layer.masksToBounds = true
            
        }
        
        
        if let button = button {
            button.layer.cornerRadius = Constants.viewRadius
            button.layer.masksToBounds = true
        }
        
        
            
            
            
        
        
    }
}
