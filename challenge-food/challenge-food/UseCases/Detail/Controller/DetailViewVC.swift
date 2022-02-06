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
    private var ingredientes = [String]()
    private var disposeBag = DisposeBag()

    override func viewDidLoad() {
        super.viewDidLoad()
        getDataDetail()
        setupTableView()
    }
    
    private func getDataDetail() {
        guard let id = idFood else { return }
        viewModel.getDetailData(idMeal: id)
            .subscribe(on: MainScheduler.instance)
            .observe(on: MainScheduler.instance)
            .subscribe { foods in
                self.detailFood = foods
                self.ingredientes = self.getIngredients(food: foods[0])
                self.ingredientsTableView.reloadData()
            } onError: { error in
                print(error.localizedDescription)
            }.disposed(by: disposeBag)
    }
    
    private func showDetail(data: Food) {
        titleLabel.text = data.strMeal
        descriptionLabel.text = data.strInstructions
    }
    
    private func getIngredients(food: Food) -> [String] {
        let array = Food.getIngredintes(data: food)
        return array
    }

}

extension DetailViewVC: UITableViewDelegate, UITableViewDataSource {
    
    private func setupTableView() {
        ingredientsTableView.register(IngredientsCell.nib(), forCellReuseIdentifier: IngredientsCell.identifier)
        ingredientsTableView.dataSource = self
        ingredientsTableView.delegate = self
        ingredientsTableView.rowHeight = UITableView.automaticDimension
        ingredientsTableView.estimatedRowHeight = UITableView.automaticDimension
        ingredientsTableView.bounces = false
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let label = UILabel()
        label.text = "Ingredientes"
        label.textAlignment = .center
        label.textColor = .white
        label.backgroundColor = .black
        return label
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ingredientes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = ingredientsTableView.dequeueReusableCell(withIdentifier: IngredientsCell.identifier, for: indexPath) as! IngredientsCell
        cell.setupCell(ingredientsText: ingredientes[indexPath.row])
        return cell
    }
    
}


