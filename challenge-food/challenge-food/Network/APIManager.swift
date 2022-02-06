//
//  LoginManager.swift
//  challenge-food
//
//  Created by Rodrigo Torres on 01/02/2022.
//

import Foundation
import RxSwift
import Alamofire

enum EndpointType {
    case listFood
    case detail
    case random
}

class APIManager {
    
    func getUrl(endpointType: EndpointType) -> String {
        
        switch endpointType {
        case .listFood:
            return Constants.URL.main+Constants.Endpoint.search
        case .detail:
            return Constants.URL.main+Constants.Endpoint.detail
        case .random:
            return Constants.URL.main+Constants.Endpoint.random
        }
        
    }
    
    func getDataFromApi(query: String = "", endpointType: EndpointType) -> Observable<[Food]> {
        let url = getUrl(endpointType: endpointType)
        
        return Observable.create { observer in
            let requestReference = AF.request(url+query).responseDecodable(of: Foods.self) { response in
                switch response.result {
                case .success(let data):
                    observer.onNext(data.meals)
                case .failure(let error):
                    observer.onError(error.underlyingError!)
                }
            }
            return Disposables.create {
                requestReference.cancel()
            }
        }
    }
}
