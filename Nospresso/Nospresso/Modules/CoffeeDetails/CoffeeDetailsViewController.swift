//
//  CoffeeDetailsViewController.swift
//  Nospresso
//
//  Created by Lucas Eduardo Backes on 20/10/20.
//

import UIKit

class CoffeeDetailsViewController: UIViewController {
    var presenter: CoffeeDetailsPresenterType?

    @IBOutlet weak var coffeImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        presenter?.screenLoaded()
    }
}

extension CoffeeDetailsViewController: CoffeeDetailsViewType {
    func showTitle(_ title: String) {
        self.title = title
    }
    
    func renderData(from coffee: Coffee) {
        DispatchQueue.main.async {
            self.coffeImageView.loadImage(with: coffee.image)
        }
    }
}
