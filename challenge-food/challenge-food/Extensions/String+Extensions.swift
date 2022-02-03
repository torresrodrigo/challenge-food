//
//  String+Extensions.swift
//  challenge-food
//
//  Created by Rodrigo Torres on 03/02/2022.
//

import Foundation

extension String {
    
    func remplaceTextInQuery() -> String {
           return self.replacingOccurrences(of: " ", with: "%20")
       }
}
