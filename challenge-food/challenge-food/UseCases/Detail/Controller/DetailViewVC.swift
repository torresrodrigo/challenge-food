//
//  DetailViewVC.swift
//  challenge-food
//
//  Created by Rodrigo Torres on 03/02/2022.
//

import UIKit
import RxSwift

class DetailViewVC: UIViewController {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var ingredientsTableView: UITableView!
    
    let viewModel = DetailViewModel()
    
    var idFood: String?
    private var detailFood = [Food]()
    private var disposeBag = DisposeBag()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        getDataDetail()
    }
    
    private func getDataDetail() {
        guard let id = idFood else { return }
        
        viewModel.getDetailData(idMeal: id)
            .subscribe(on: MainScheduler.instance)
            .observe(on: MainScheduler.instance)
            .subscribe { foods in
                self.detailFood = foods
                print(self.detailFood)
            } onError: { error in
                print(error.localizedDescription)
            }.disposed(by: disposeBag)
    }

}
