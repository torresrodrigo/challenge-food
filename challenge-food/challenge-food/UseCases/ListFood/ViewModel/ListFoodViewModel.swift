//
//  File.swift
//  challenge-food
//
//  Created by Rodrigo Torres on 31/01/2022.
//

import Foundation
import RxSwift


class ListFoodViewModel {
    
    private weak var view: ListFoodVC?
    private var router: ListFoodRouter?
    private var apiManager = APIManager()

    private var foods = [Foods]()
    private var disposeBag = DisposeBag()
        
    func bind(view: ListFoodVC, router: ListFoodRouter) {
        self.view = view
        self.router = router
        self.router?.setSourceView(view)
    }
    
    func getListFoods(search: String) -> Observable<[Food]> {
        return apiManager.getDataFromApi(query: search, endpointType: .listFood)
    }
    
    func makeDetailView() {
        router?.navigateToDetailView()
    }
}
