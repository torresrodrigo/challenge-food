//
//  DetailViewRouter.swift
//  challenge-food
//
//  Created by Rodrigo Torres on 03/02/2022.
//

import Foundation
import UIKit

class DetailViewRouter {
    
    var viewController: UIViewController {
        return createViewController()
    }
    
    var idFood: String
    private var sourceView: UIViewController?
    
    init(idFood: String) {
        self.idFood = idFood
    }
    
    func createViewController() -> UIViewController {
        let view = DetailViewVC(nibName: "DetailViewVC", bundle: Bundle.main)
        view.title = "Detalle"
        view.idFood = self.idFood
        return view
    }
    
    func setSourceView(_ sourceView: UIViewController?) {
        guard let view = sourceView else {(fatalError("Error"))}
        self.sourceView = view
    }
    
    
}

