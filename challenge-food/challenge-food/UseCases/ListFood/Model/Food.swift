//
//  Food.swift
//  challenge-food
//
//  Created by Rodrigo Torres on 01/02/2022.
//

import Foundation

struct Food: Codable {
    
    //let id: String
    let strMeal: String
    let strCategory: String
    let strMealThumb: String
    
    enum CodingKeys: String, CodingKey {
        //case id = "idMeal"
        case strMeal
        case strCategory
        case strMealThumb
    }
    
    
}
