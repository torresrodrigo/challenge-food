//
//  ListFoodVC.swift
//  challenge-food
//
//  Created by Rodrigo Torres on 31/01/2022.
//

import UIKit

class ListFoodVC: UIViewController {

    private var router = ListFoodRouter()
    
    @IBOutlet weak var listFoodTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        
    }

}

extension ListFoodVC: UITableViewDelegate, UITableViewDataSource {
    
    func setupTableView() {
        listFoodTableView.register(FoodCell.nib(), forCellReuseIdentifier: FoodCell.identifier)
        listFoodTableView.delegate = self
        listFoodTableView.dataSource = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = listFoodTableView.dequeueReusableCell(withIdentifier: FoodCell.identifier, for: indexPath) as! FoodCell
        return cell
    }
    
    
    

}
