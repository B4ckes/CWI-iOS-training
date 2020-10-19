//
//  CoffeeTableViewCell.swift
//  Nospresso
//
//  Created by Lucas Eduardo Backes on 15/10/20.
//

import UIKit

class CoffeeTableViewCell: UITableViewCell {
    @IBOutlet weak var coffeeImageView: UIImageView!
    @IBOutlet weak var coffeeNameLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var intensityLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    
    func config(with coffee: CoffeeItem) {
        coffeeImageView.loadImage(with: coffee.image)
        coffeeNameLabel.text = coffee.name
        descriptionLabel.text = coffee.coffeeDescription
        intensityLabel.text = "intensidade: \(coffee.intensity ?? 0)"
        priceLabel.text = String(format: "R$ %.02f", coffee.price)
    }
}
