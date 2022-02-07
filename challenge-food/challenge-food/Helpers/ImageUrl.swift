//
//  ImageUrl.swift
//  challenge-food
//
//  Created by Rodrigo Torres on 06/02/2022.
//

import Foundation
import SDWebImage

class ImageURL {
    func getImage(imageUrl: String?, imageView: UIImageView) {
        if let path = imageUrl {
            let imageUrl = URL(string: path)
            imageView.sd_setImage(with: imageUrl)
        }
    }
}
