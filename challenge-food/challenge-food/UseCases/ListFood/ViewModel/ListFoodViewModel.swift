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
    private var apiManager: APIManager
    private var searchText = ""
    private var foods = [Foods]()
    private var disposeBag = DisposeBag()
    
    init(apiManager: APIManager) {
        self.apiManager = apiManager
    }
    
    func bind(view: ListFoodVC, router: ListFoodRouter) {
        self.view = view
        self.router = router
        self.router?.setSourceView(view)
    }
    
    func getSearchText(textInput: String) {
        searchText = textInput
    }
    
    func getListFoods() {
        apiManager.getListFood(search: searchText)
            .subscribe(on: MainScheduler.instance)
            .observe(on: MainScheduler.instance)
            .subscribe { foods in
                self.foods = foods
                print(self.foods)
            } onError: { error in
                print(error.localizedDescription)
            }.disposed(by: disposeBag)
    }
}
