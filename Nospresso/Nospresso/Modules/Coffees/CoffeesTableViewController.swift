//
//  CoffeesTableViewController.swift
//  Nospresso
//
//  Created by Lucas Eduardo Backes on 15/10/20.
//

import UIKit

class CoffeesTableViewController: UITableViewController {
    
    private let API = Api()
    private var categories: [CoffeeCategory] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Cafés"
        
        removeTextFromBackButton()
        
        request()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationController?.setNavigationBarHidden(false, animated: true)
        navigationController?.navigationBar.barTintColor = Colors.coffees()
        navigationController?.navigationBar.tintColor = .black
    }
}

// MARK: Backend
extension CoffeesTableViewController {
    func request() {
        API.request(endpoint: .capsulas) { (categories: [CoffeeCategory]) in
            self.categories = categories
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        } failure: { error in
            print(error)
        }
    }
}

// MARK: UITableViewDelegate
extension CoffeesTableViewController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        categories[section].coffees.count
    }

    override func numberOfSections(in tableView: UITableView) -> Int { categories.count }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = R.nib.coffeeCategoryHeaderView.firstView(owner: nil)

        header?.config(to: categories[section])
        
        return header
    }

    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? { "Section \(section)" }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat { 50 }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat { 100 }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "coffeeCell", for: indexPath) as! CoffeeTableViewCell
        
        let coffee = categories[indexPath.section].coffees[indexPath.row]
        
        cell.config(with: coffee)
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let coffee = categories[indexPath.section].coffees[indexPath.row]
        
        let detailsVC = CoffeeDetailsPresenter.createModule(with: coffee)
        
        navigationController?.pushViewController(detailsVC, animated: true)
    }
}
