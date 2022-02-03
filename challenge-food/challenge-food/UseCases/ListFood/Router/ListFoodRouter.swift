//
//  ListFoodRouter.swift
//  challenge-food
//
//  Created by Rodrigo Torres on 31/01/2022.
//

import Foundation
import UIKit

class ListFoodRouter {
    
    var viewController: UIViewController {
        return createViewController()
    }
    
    private var sourceView: UIViewController?
    
    func createViewController() -> UIViewController {
        let view = ListFoodVC(nibName: "ListFoodVC", bundle: nil)
        view.title = "Lista de Comidas"
        return view
    }
    
    func setSourceView(_ sourceView: UIViewController?) {
        guard let view = sourceView else {fatalError("Error")}
        self.sourceView = view
    }
    
    func navigateToDetailView() {
        let detailView = DetailViewRouter().viewController
        sourceView?.navigationController?.pushViewController(detailView, animated: true)
    }
    
}
