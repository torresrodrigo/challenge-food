//
//  Food.swift
//  challenge-food
//
//  Created by Rodrigo Torres on 01/02/2022.
//

import Foundation

struct Food: Codable {
    
    let id: String
    let nameMeal: String
    let categoryMeal: String
    let imageMeal: String
    
    enum CodingKeys: String, CodingKey {
        case id = "idMeal"
        case nameMeal = "strMeal"
        case categoryMeal = "strCategory"
        case imageMeal = "strMealThumb"
    }
    
    
}
