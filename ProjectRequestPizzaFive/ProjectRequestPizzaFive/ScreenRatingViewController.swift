//
//  ScreenRatingViewController.swift
//  ProjectRequestPizzaFive
//
//  Created by Mirian Santana on 20/03/23.
//

import UIKit

class ScreenRatingViewController: UIViewController {

    @IBOutlet weak var lblNamePizza: UILabel!
    @IBOutlet weak var imagePizza: UIImageView!
    @IBOutlet weak var lblRating: UILabel!
    
    var screenRating: PizzaElement?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func btAdvance(_ sender: Any) {
    }
    
    @IBAction func btBack(_ sender: Any) {
    }
}
