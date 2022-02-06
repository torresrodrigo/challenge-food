//
//  Food.swift
//  challenge-food
//
//  Created by Rodrigo Torres on 01/02/2022.
//

import Foundation

struct Food: Codable {
    
    let idMeal: String
    let strMeal: String
    let strInstructions: String
    let strCategory: String
    let strMealThumb: String
    
    let strIngredient1: String
    let strIngredient2: String
    let strIngredient3: String
    let strIngredient4: String
    let strIngredient5: String
    let strIngredient6: String
    let strIngredient7: String
    let strIngredient8: String
    let strIngredient9: String
    let strIngredient10: String
    let strIngredient11: String
    let strIngredient12: String
    let strIngredient13: String
    let strIngredient14: String
    let strIngredient15: String
    let strIngredient16: String
    let strIngredient17: String
    let strIngredient18: String
    let strIngredient19: String
    let strIngredient20: String

    
    
    enum CodingKeys: String, CodingKey {
        case idMeal
        case strMeal
        case strInstructions
        case strCategory
        case strMealThumb
        
        case strIngredient1
        case strIngredient2
        case strIngredient3
        case strIngredient4
        case strIngredient5
        case strIngredient6
        case strIngredient7
        case strIngredient8
        case strIngredient9
        case strIngredient10
        case strIngredient11
        case strIngredient12
        case strIngredient13
        case strIngredient14
        case strIngredient15
        case strIngredient16
        case strIngredient17
        case strIngredient18
        case strIngredient19
        case strIngredient20
    }
    
    
    static func getIngredintes(data: Food) -> [String] {
        let array = [
            data.strIngredient1,
            data.strIngredient2,
            data.strIngredient3,
            data.strIngredient4,
            data.strIngredient5,
            data.strIngredient6,
            data.strIngredient7,
            data.strIngredient8,
            data.strIngredient9,
            data.strIngredient10,
            data.strIngredient11,
            data.strIngredient12,
            data.strIngredient13,
            data.strIngredient14,
            data.strIngredient15,
            data.strIngredient16,
            data.strIngredient17,
            data.strIngredient18,
            data.strIngredient19,
            data.strIngredient20,
        ]
        
        let mapArray = array.filter {$0 != ""}
        return mapArray
    }
}
