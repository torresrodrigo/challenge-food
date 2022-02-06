//
//  FoodCell.swift
//  challenge-food
//
//  Created by Rodrigo Torres on 31/01/2022.
//

import UIKit
import SDWebImage

class FoodCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subtitleLabel: UILabel!
    @IBOutlet weak var imageFood: UIImageView!
    
    let imageHelper = ImageURL()
    
    static let identifier = String(describing: FoodCell.self)
    static func nib() -> UINib {
        return UINib(nibName: "FoodCell", bundle: nil)
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setupCell(food: Food) {
        titleLabel.text = food.strMeal
        subtitleLabel.text = food.strCategory
        imageHelper.getImage(imageUrl: food.strMealThumb, imageView: imageFood  )
        
    }
    
}
