//
//  Foods.swift
//  challenge-food
//
//  Created by Rodrigo Torres on 01/02/2022.
//

import Foundation

struct Foods: Codable {

    let meals: [Food]
    
    enum CodingKeys: String, CodingKey {
        case meals
    }
    
}
