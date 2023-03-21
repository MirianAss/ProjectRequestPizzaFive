//
//  TableViewPizzaViewController.swift
//  ProjectRequestPizzaFive
//
//  Created by Mirian Santana on 20/03/23.
//

import UIKit
import Alamofire

class TableViewPizzaViewController: UIViewController {
    
    var arrayPizza: Pizza?
    
    func requestPizza() {
        AF.request("https://p3teufi0k9.execute-api.us-east-1.amazonaws.com/v1/pizza").response {response in
            
            let pizza = try? JSONDecoder().decode(Pizza.self, from: response.data ?? Data())
            self.arrayPizza = pizza
            self.tableView.reloadData()
            
        }
    }

    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        requestPizza()
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UINib(nibName: "PizzaTableViewCell", bundle: nil), forCellReuseIdentifier: "cell")
    }
    
}
extension TableViewPizzaViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.arrayPizza?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? PizzaTableViewCell {
            
            cell.setupPizza(pizza: arrayPizza?[indexPath.row])
            
            return cell
        }
        return UITableViewCell()
    }
    
}
extension TableViewPizzaViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let screen = storyboard?.instantiateViewController(withIdentifier: "rating") as? ScreenRatingViewController {
            
            screen.screenRating = self.arrayPizza?[indexPath.row]
            
            self.navigationController?.pushViewController(screen, animated: true)
        }
    }
}
