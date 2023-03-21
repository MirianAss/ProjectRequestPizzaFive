//
//  screenValueViewController.swift
//  ProjectRequestPizzaFive
//
//  Created by Mirian Santana on 20/03/23.
//

import UIKit

class screenValueViewController: UIViewController {
    @IBOutlet weak var lblNamePizza: UILabel!
    @IBOutlet weak var lblPizzaP: UILabel!
    @IBOutlet weak var lblPizzaM: UILabel!
    @IBOutlet weak var lblPizzaG: UILabel!
    
    var screenValue: PizzaElement?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        lblPizzaP.text = "PEQUENA - \(screenValue?.priceP ?? 0.0)"
        lblPizzaM.text = "MÉDIA - \(screenValue?.priceM ?? 0.0)"
        lblPizzaG.text = "GRANDE - \(screenValue?.priceG ?? 0.0)"
    }
    
    @IBAction func btBack(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
}
