//
//  ListFoodVC.swift
//  challenge-food
//
//  Created by Rodrigo Torres on 31/01/2022.
//

import UIKit
import RxSwift

class ListFoodVC: UIViewController {

    private var router = ListFoodRouter()
    private var viewModel = ListFoodViewModel()
    private var foods = [Food]()
    private var disposeBag = DisposeBag()
    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var listFoodTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.bind(view: self, router: router)
        setupTableView()
        setupSearchBar()
    }
    
    func getListFoods(search: String) {
        viewModel.getListFoods(search: search.remplaceTextInQuery())
            .subscribe(on: MainScheduler.instance)
            .observe(on: MainScheduler.instance)
            .subscribe { foods in
                self.foods = foods
                self.reloadTableView()
                print(foods.count)
            } onError: { error in
                print(error.localizedDescription)
                self.resetFoods()
            }.disposed(by: disposeBag)
    }
    
    
    private func reloadTableView() {
        DispatchQueue.main.async {
            self.listFoodTableView.reloadData()
        }
    }
    
    func resetFoods() {
        foods.removeAll()
        reloadTableView()
    }
    
    
    

}

extension ListFoodVC: UITableViewDelegate, UITableViewDataSource {
    
    func setupTableView() {
        listFoodTableView.register(FoodCell.nib(), forCellReuseIdentifier: FoodCell.identifier)
        listFoodTableView.delegate = self
        listFoodTableView.dataSource = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return foods.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = listFoodTableView.dequeueReusableCell(withIdentifier: FoodCell.identifier, for: indexPath) as! FoodCell
        cell.setupCell(food: foods[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        viewModel.makeDetailView(idFood: foods[indexPath.row].idMeal)
    }

}

extension ListFoodVC: UISearchBarDelegate, UISearchDisplayDelegate {
    
    func setupSearchBar() {
        searchBar.delegate = self
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText.isEmpty {
            listFoodTableView.isHidden = true
            resetFoods()
        } else {
            listFoodTableView.isHidden = false
            getListFoods(search: searchText)
        }
    }
    
    
    
}
