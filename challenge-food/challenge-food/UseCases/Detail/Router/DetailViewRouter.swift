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
    
    private var sourceView: UIViewController?
    
    func createViewController() -> UIViewController {
        let view = DetailViewVC(nibName: "DetailViewVC", bundle: nil)
        return view
    }
    
    func setSourceView(_ sourceView: UIViewController?) {
        guard let view = sourceView else {(fatalError("Error"))}
        self.sourceView = view
    }
}

