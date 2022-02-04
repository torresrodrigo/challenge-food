//
//  DetailViewModel.swift
//  challenge-food
//
//  Created by Rodrigo Torres on 03/02/2022.
//

import Foundation
import RxSwift

class DetailViewModel {
    private weak var view : DetailViewVC?
    private (set) var router: DetailViewRouter?
    private var apiManager = APIManager()
    
    private var foods = [Foods]()
    private var disposeBag = DisposeBag()
    
    func bind(view: DetailViewVC, router: DetailViewRouter) {
        self.view = view
        self.router = router
    }
    
    func getDetailData(idMeal: String) -> Observable<[Food]> {
        return apiManager.getDataFromApi(query: idMeal, endpointType: .detail)
    }

}
