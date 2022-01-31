//
//  File.swift
//  challenge-food
//
//  Created by Rodrigo Torres on 31/01/2022.
//

import Foundation

class ListFoodViewModel {
    
    private weak var view: ListFoodVC?
    private var router: ListFoodRouter?
    
    func bind(view: ListFoodVC, router: ListFoodRouter) {
        self.view = view
        self.router = router
        self.router?.setSourceView(view)
    }
}
