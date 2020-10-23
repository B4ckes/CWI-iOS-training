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
    @IBOutlet weak var measuresStackView: UIStackView!
    @IBOutlet weak var intensityStackView: IntensityCounterStackView!
    @IBOutlet weak var intensityLabel: UILabel!
    
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
            
            if let intensity = coffee.intensity {
                self.intensityStackView.config(for: intensity)
                self.intensityLabel.text = "intensidade: \(intensity)"
            } else {
                self.intensityLabel.isHidden = true
            }
            
            for measure in coffee.measures {
                let view = MeasureView.doNib()
                view.config(with: measure)
                self.measuresStackView.addArrangedSubview(view)
            }

            self.measuresStackView.addArrangedSubview(UIView())
        }
    }
}
