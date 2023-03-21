//
//  ScreenRatingViewController.swift
//  ProjectRequestPizzaFive
//
//  Created by Mirian Santana on 20/03/23.
//

import UIKit
import SDWebImage

class ScreenRatingViewController: UIViewController {

    @IBOutlet weak var lblNamePizza: UILabel!
    @IBOutlet weak var imagePizza: UIImageView!
    @IBOutlet weak var lblRating: UILabel!
    
    var screenRating: PizzaElement?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        lblNamePizza.text = screenRating?.name ?? ""
        let urlImage = URL(string: screenRating?.imageURL ?? "")
        imagePizza.sd_setImage(with: urlImage)
        lblRating.text = "Segundo nossos clientes, a pizza \(screenRating?.name ?? "") está na posição - \(screenRating?.rating ?? 0)/5 - de aprovação"
    }

    @IBAction func btAdvance(_ sender: Any) {
        if let screen = storyboard?.instantiateViewController(withIdentifier: "value") as? screenValueViewController {
            
            screen.screenValue = screenRating.self
            
            self.navigationController?.pushViewController(screen, animated: true)
        }
    }
    
    @IBAction func btBack(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
}
