//
//  FoodCell.swift
//  challenge-food
//
//  Created by Rodrigo Torres on 31/01/2022.
//

import UIKit

class FoodCell: UITableViewCell {

    static let identifier = String(describing: FoodCell.self)
    static func nib() -> UINib {
        return UINib(nibName: "FoodCell", bundle: nil)
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
