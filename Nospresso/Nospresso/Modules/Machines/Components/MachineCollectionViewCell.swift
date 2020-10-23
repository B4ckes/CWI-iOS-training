//
//  MachineCollectionViewCell.swift
//  Nospresso
//
//  Created by Lucas Eduardo Backes on 22/10/20.
//

import UIKit

class MachineCollectionViewCell: UICollectionViewCell {
    
    
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var image: UIImageView!
    @IBOutlet private weak var priceLabel: UILabel!
    @IBOutlet private weak var favoriteButton: UIButton!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func config(with machine: Machine) {
        titleLabel.text = machine.name
        image.loadImage(with: machine.image)
        priceLabel.text = machine.price.toCurrency
    }
}
