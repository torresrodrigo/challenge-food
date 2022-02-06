//
//  IngredientsCell.swift
//  challenge-food
//
//  Created by Rodrigo Torres on 05/02/2022.
//

import UIKit

class IngredientsCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    
    static let identifier = String(describing: IngredientsCell.self)
    static func nib() -> UINib {
        return UINib(nibName: "IngredientsCell", bundle: nil)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func setupCell(ingredientsText: String) {
        titleLabel.text = ingredientsText
    }
    
}
