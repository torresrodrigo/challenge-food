//
//  Foods.swift
//  challenge-food
//
//  Created by Rodrigo Torres on 01/02/2022.
//

import Foundation

struct Foods: Codable {

    let listOfFoods: [Foods]
    
    enum CodingKeys: String, CodingKey {
        case listOfFoods = "meals"
    }
    
}
