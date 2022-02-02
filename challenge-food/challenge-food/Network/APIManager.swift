//
//  LoginManager.swift
//  challenge-food
//
//  Created by Rodrigo Torres on 01/02/2022.
//

import Foundation
import RxSwift
import Alamofire

class APIManager {
    
    func getListFood(search: String) -> Observable<[Food]> {
        let url = Constants.URL.main+Constants.Endpoint.search+search
        print(url)
        return Observable.create { observer in
            let requestReference = AF.request(url).responseDecodable(of: Foods.self) { response in
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
